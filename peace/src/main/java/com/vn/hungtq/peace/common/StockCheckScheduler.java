package com.vn.hungtq.peace.common;

import com.vn.hungtq.peace.entity.StockRegistorEntity;
import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.service.ContactDaoService;
import com.vn.hungtq.peace.service.StockRegistorDaoService;
import com.vn.hungtq.peace.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by napt2017 on 4/30/2017.
 * ALTER TABLE `peace`.`stock_registor`
 * ADD COLUMN `user_id` INT(11) NOT NULL AFTER `stock_word`;

 */
public class StockCheckScheduler {

    @Autowired
    private UserDaoService userDaoService;

    @Autowired
    private StockRegistorDaoService stockRegistorDaoService;

    @Autowired
    private ContactDaoService contactDAO;

    @Autowired
    private PeaceContactEmail peaceContactEmail;

    @Autowired
    private GmailConfiguration gmailConfiguration;

    @Scheduled(cron = "0 0 0 * * *")
    public void checkStockAt0Hour(){
        checkStock();
    }

    @Scheduled(cron = "0 0 8 * * *")
    public void checkStockAt8Hour(){
        checkStock();
    }

    @Scheduled(cron = "0 0 12 * * *")
    public void checkStockAt12Hour(){
        checkStock();
    }

    @Scheduled(cron = "0 0 18 * * *")
    public void checkStockAt18Hour(){
        checkStock();
    }

    private void checkStock(){
        //Get all stock registor
        List<StockRegistorEntity> allStockRegistor = stockRegistorDaoService.getAllStockRegistor();

        //Map with user id
        Map<Integer,List<StockRegistorEntity>> mapUserWithStock = allStockRegistor.stream().collect(Collectors.groupingBy(StockRegistorEntity::getUserId));

        //Loop to process
        mapUserWithStock.entrySet().stream().forEach(entry->{
            //Get user id
            int userId = entry.getKey();

            //Get user
            User user = userDaoService.getUserById(userId);

            //Get email
            String userEmail = user.getEmail();

            //Get list stock
            List<StockRegistorEntity> lstOfUserStock = entry.getValue();
            Map<StockCheckType,List<String>> mapStockCheck = new HashMap<>();
            lstOfUserStock.stream().peek(srEntity ->{
                //Get the stock url
                String stockUrl = srEntity.getVendorUrl();

                //Get stock response data
                String responseContent = CommonUtils.getHTMLContent(stockUrl);
                StockCheckType scType = processStockResponseData(responseContent,srEntity.getLogicCheck());

                //Add to map
                if(mapStockCheck.containsKey(scType)){
                    mapStockCheck.get(scType).add(stockUrl);
                }else{
                    List<String> lstUrl = new ArrayList<>();
                    lstUrl.add(stockUrl);
                    mapStockCheck.put(scType,lstUrl);
                }
            }).count();

            //Build mail content
            String emailContent = buildEmailContent(mapStockCheck);

            //Send email
            CommonUtils.sendEmail("Stock check!!!",userEmail,emailContent,peaceContactEmail,gmailConfiguration);
        });
    }

    private String buildEmailContent(Map<StockCheckType,List<String>> mapStockCheck){
        StringBuilder sb = new StringBuilder();
        mapStockCheck.entrySet().stream().peek(entry->{
            //Build header
            sb.append("<h3>").append(entry.getKey()).append("</h3>");
            sb.append("<ul>");

            //Get list of url
            List<String> lstUrl = entry.getValue();
            lstUrl.stream().peek(url->{
                sb.append("<li>").append(url).append("</li>");
            }).count();

            sb.append("</ul>");

        }).count();
        return sb.toString();
    }

    private StockCheckType processStockResponseData(String htmlStockResponseData ,int stockCheckType){
        if(stockCheckType==1){
            if(htmlStockResponseData.contains("個数")){
                return StockCheckType.HAS_STOCK;
            }else{
                return StockCheckType.HAS_NOT_STOCK;
            }
        }else if(stockCheckType==2){
            if(htmlStockResponseData.contains("個数") && htmlStockResponseData.contains("円")){
                return  StockCheckType.HAS_STOCK;
            }else{
                return  StockCheckType.HAS_NOT_STOCK;
            }
        }

        return StockCheckType.HAS_NOT_STOCK;
    }
}
