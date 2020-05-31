package com.example.my_framework;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.JSONMethodCodec;
import io.flutter.plugin.common.MethodChannel;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/battery";


    public static final String StreamChannel = "stream";



    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        demoMethodChanelGetBattery(flutterEngine);
        demoMethodChannel1(flutterEngine);
        demoMethodChannel2(flutterEngine);
        demoShowToas(flutterEngine);

    }





    public void demoOpenActivity(FlutterEngine flutterEngine){

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "com.code4func/open_activity")
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("openActivity")) {
                               startNewActivity();
                            } else {
                                result.notImplemented();
                            }
                        }
                );

    }

    public void demoShowToas(FlutterEngine flutterEngine){

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "com.code4func/toast")
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("showToast")) {
                                Toast.makeText(getApplicationContext(),"Flutter toast",Toast.LENGTH_SHORT).show();
                            } else {
                                result.notImplemented();
                            }
                        }
                );

    }


    public void demoMethodChannel1(FlutterEngine flutterEngine){

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "com.code4func/method1")
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("getDeviceInfoString")) {
                                String type = call.argument("type");

                                if (type == null || (type != null && type.isEmpty())) {
                                    result.error("ERROR", "type can not null", null);
                                    return;
                                }
                                result.success(getDeviceInfoString(type));
                                return;
                            } else {
                                result.notImplemented();
                            }
                        }
                );

    }

    public void demoMethodChannel2(FlutterEngine flutterEngine){
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "com.code4func/method2", JSONMethodCodec.INSTANCE)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("getDeviceInfo")) {
                                String type = call.argument("type");

                                if (type == null || (type != null && type.isEmpty())) {
                                    result.error("ERROR", "type can not null", null);
                                    return;
                                }
                                result.success(getDeviceInfo(type));
                                return;
                            }

                            result.notImplemented();
                        }
                );

    }

    public void demoMethodChanelGetBattery(FlutterEngine flutterEngine){

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("getBatteryLevel")) {
                                int batteryLevel = getBatteryLevel();

                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Battery level not available.", null);
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );

    }



    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

    String getDeviceInfoString(String type) {
        if (type.equals("MODEL")) {
            return Build.MODEL;
        }

        return null;
    }

    JSONObject getDeviceInfo(String type) {
        JSONObject json = new JSONObject();
        if (type.equals("MODEL")) {
            try {
                json.put("result", Build.MODEL);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return json;
        }

        return null;
    }

    private void startNewActivity() {
      

    }


}
