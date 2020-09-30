package com.salamay.chatapp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import static android.content.Intent.FLAG_INCLUDE_STOPPED_PACKAGES;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL="XmppIntialization";
    private static final String CHANNEL2="SendMessageToAndroid";
    private BroadcastReceiver IncominfMessageReciever;
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {

        GeneratedPluginRegistrant.registerWith(flutterEngine);
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),CHANNEL).setMethodCallHandler((methodCall, result) -> {
           if (methodCall.method.equals("startXmmppService")){

               startXmmppService();

           }
        });
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),CHANNEL2).setMethodCallHandler((methodCall, result) ->

                {
                    String messageToBeSent=methodCall.argument("message");
                    System.out.println("[Message]: " +messageToBeSent);
                    IncominfMessageReciever=new BroadcastReceiver() {
                        @Override
                        public void onReceive(Context context, Intent intent) {
                            Bundle data=intent.getExtras();
                            assert data != null;
                            String message=data.getString("message");
                            String from=data.getString("from");
                            System.out.println("[new message]: " +message);
                            System.out.println("[new message]: " +from);
                            List<String> IM=new ArrayList<>();
                            IM.add(message);
                            IM.add(from);
                            IM.add("RECEIVED");
                            System.out.println(IM);
                            result.success(IM);
                        }

                    };
                    IntentFilter intentFilter=new IntentFilter("com.salamay.incomingmessage");
                    registerReceiver(IncominfMessageReciever,intentFilter);
                    //Sendmessage
                    sendMessage(messageToBeSent,result);
                });
    }



    private void startXmmppService(){
        System.out.println("Native Method called");
        Intent intent=new Intent(this,XMPPService.class);
        startService(intent);
    }

    private void sendMessage(String message, MethodChannel.Result result){
        if (XMPPService.xmppmanager.isConnected){
            Intent i=new Intent();
            i.setFlags(FLAG_INCLUDE_STOPPED_PACKAGES);
            i.setAction("com.salamay.sendmessage");
            i.putExtra("message",message);
            System.out.println(XMPPService.xmppmanager.isConnected);
            sendBroadcast(i);
            System.out.println("BroadcastSent");
        }else{
            result.notImplemented();
        }
    }
}