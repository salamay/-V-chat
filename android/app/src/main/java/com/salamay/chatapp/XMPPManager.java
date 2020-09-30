package com.salamay.chatapp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.ReconnectionManager;
import org.jivesoftware.smack.SmackException;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.chat2.Chat;
import org.jivesoftware.smack.chat2.ChatManager;
import org.jivesoftware.smack.chat2.IncomingChatMessageListener;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.jivesoftware.smack.tcp.XMPPTCPConnectionConfiguration;
import org.jxmpp.jid.EntityBareJid;
import org.jxmpp.jid.impl.JidCreate;
import org.jxmpp.stringprep.XmppStringprepException;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;


public class XMPPManager {
    private BroadcastReceiver chatJID;
    private Context context;
    private String uid;
    private XMPPTCPConnection xmpptcpConnection;
    private String domain="localhost";
    private static int port=5222;
    private InetAddress address;
    private String password;
    boolean isConnected=false;
    boolean isAuth=false;
    public XMPPManager(String uid, String password, Context context){
        this.uid=uid;
        this.password=password;
        this.context=context;
    }
    public void Connection(){
        Log.i("XMMPPMANAGER", "trying to connect");
        try {
            address=InetAddress.getByName("192.168.43.140");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        final XMPPTCPConnectionConfiguration.Builder config= XMPPTCPConnectionConfiguration.builder();
        try {
            config.setXmppDomain(domain);
            config.setHostAddress(address);
            config.setResource("Android");
            config.setUsernameAndPassword(uid,password);
            config.setPort(port);
            config.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled);
            xmpptcpConnection=new XMPPTCPConnection(config.build());
            xmpptcpConnection.addConnectionListener(new ConnectionListener() {
                @Override
                public void connected(XMPPConnection connection) {
                    Log.i("XMMPPMANAGER", "Connected");
                    isConnected=true;
                }

                @Override
                public void authenticated(XMPPConnection connection, boolean resumed) {
                    Log.i("XMMPPMANAGER", "Authenticated");
                    isAuth=true;
                }

                @Override
                public void connectionClosed() {
                    Log.i("XMMPPMANAGER", "Connection close");
                    isConnected=false;
                }

                @Override
                public void connectionClosedOnError(Exception e) {
                    Log.i("XMMPPMANAGER", "connection close on error");
                    isConnected=false;
                }
            });
            ReconnectionManager reconnectionManager=ReconnectionManager.getInstanceFor(xmpptcpConnection);
            ReconnectionManager.setEnabledPerDefault(true);
            reconnectionManager.enableAutomaticReconnection();
            try {
                xmpptcpConnection.connect();
                xmpptcpConnection.login();
                MessageReceiver();
            } catch (SmackException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (XMPPException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        } catch (XmppStringprepException e) {
            e.printStackTrace();
        }



        //////Incoming message Handler
        ChatManager.getInstanceFor(xmpptcpConnection).addIncomingListener(new IncomingChatMessageListener() {
            @Override
            public void newIncomingMessage(EntityBareJid from, Message message, Chat chat) {
                String sender=message.getFrom().toString();
                String incomeMessage=message.getBody();
                Intent i=new Intent();
                i.putExtra("message",incomeMessage);
                i.putExtra("from",sender);
                i.setAction("com.salamay.incomingmessage");
                context.sendBroadcast(i);
            }
        });

    }
    public void Disconnect(){
        Log.i("XMMPPMANAGER", "trying to disconnect");
        xmpptcpConnection.disconnect();
        isConnected=false;
    }
    private  void MessageReceiver(){
        //Chat method
        chatJID=new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                Bundle data=intent.getExtras();

                String Rmessage="";
                if (data != null) {
                    Rmessage = data.getString("message");
                }
                System.out.println(Rmessage);
                String recipent="user1";
                System.out.println(recipent);
                sendMessage(recipent,Rmessage);
            }
        };
        IntentFilter intentFilter=new IntentFilter("com.salamay.sendmessage");
        context.registerReceiver(chatJID,intentFilter);
    }
    private void sendMessage(String RecipentJid,String messagetoBesent){
        ChatManager chatManager=ChatManager.getInstanceFor(xmpptcpConnection);
        EntityBareJid jid=null;
        try {
            jid = JidCreate.entityBareFrom(RecipentJid+"@localhost");
        } catch (XmppStringprepException e) {
            e.printStackTrace();
        }
        Log.i("XMPP",String.valueOf(isConnected));

        Chat chat=chatManager.chatWith(jid);
        try {
            chat.send(messagetoBesent);
            Log.i("XMPP","Message sent");
        } catch (SmackException.NotConnectedException | InterruptedException e) {
            e.printStackTrace();
        }

    }
    public boolean isServerConnected(){
        if (isConnected){
            return true;
        }
        else {
            return false;
        }
    }
    public boolean isAuthenticated(){
        if (isAuth){
            return true;
        }
        else {
            return false;
        }
    }

}