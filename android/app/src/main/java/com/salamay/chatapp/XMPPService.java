package com.salamay.chatapp;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class XMPPService extends Service {
    public static XMPPManager xmppmanager;
    private Thread thread;
    private Context context;
    public XMPPService() {

    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        context=getApplicationContext();
        Log.i("XMPPSERVICE", "Service has started");
        final String uid="user1";
        final String password="oluwole";
        Log.i("XMPPSERVICE", "UID-> "+uid);
        Log.i("XMPPSERVICE", "Password-> "+password);
        thread=new Thread(new Runnable() {
            @Override
            public void run() {
                xmppmanager=new XMPPManager(uid,password,context);
                xmppmanager.Connection();

            }
        });
        thread.start();
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        return null;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (!xmppmanager.isConnected){
            xmppmanager.Disconnect();
            System.out.println("[XMPPSERVICE]: service has Stop");
        }
    }
}
