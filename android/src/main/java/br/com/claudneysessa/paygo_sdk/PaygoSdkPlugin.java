package br.com.claudneysessa.paygo_sdk;

import android.content.Context;

import java.io.IOException;

import java.util.Iterator;
import java.util.Vector;
import java.util.HashMap;
import java.io.File;

import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import android.content.Intent;
import android.content.IntentFilter;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.nio.charset.StandardCharsets;

import androidx.lifecycle.Lifecycle;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

/** PaygoSdkPlugin */
public class PaygoSdkPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler {

  private MethodChannel channel;
  Context context;
  private static final String PayGOIntegradoChannel = "br.com.claudneysessa/PayGOIntegrado";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    
    channel = new MethodChannel(
      flutterPluginBinding.getBinaryMessenger(), 
      PayGOIntegradoChannel
    );

    channel.setMethodCallHandler(this);

  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    switch (call.method) {

      // Metodo para Verificar se o Channel esta comunicanco com o APP
      
      case "verificarStatusDoChannel":

        try {

          HashMap map = call.argument("args");

          String mensagem = (String) map.get("mensagem");

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - OK");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.verificarStatusDoChannel");
          System.out.println("| - Mensagem: " + mensagem);
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.success(true);
        
        } catch (Exception e) {

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - Exception");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.verificarStatusDoChannel");
          System.out.println("| - Error: " + e.toString());
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");
          
          result.error(
            "Method: verificarStatusDoChannel", 
            e.toString(), 
            false
          );

        }

        break;

      // Metodo para Iniciar uma Transação via URI

      case "iniciarTransacaoUri":

        try {

          HashMap map = call.argument("args");

          String pIntentAction = (String) map.get("intentAction");
          String pUri = (String) map.get("requisicao");
          String pDadosAutomacao = (String) map.get("dadosAutomacao");
          String pPersonalizacao = (String) map.get("dadosPersonalizacao");

          Uri uri = Uri.parse(pUri);

          iniciaTransacao(
            context, 
            pIntentAction, 
            uri, 
            pDadosAutomacao, 
            pPersonalizacao
          );

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - OK");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.iniciarTransacaoUri");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.success(true);

        } catch (Exception e) {

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - Exception");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.iniciarTransacaoUri");
          System.out.println("| - Error: " + e.toString());
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.error(
            "Method: iniciarTransacaoUri", 
            e.toString(), 
            false
          );          

        }

        break;

      // Metodo para Confirmar uma Transação via URI

      case "confirmarTransacao":

        try {

          HashMap map = call.argument("args");

          String pIntentAction = (String) map.get("intentAction");
          String pUri = (String) map.get("requisicao");

          confirmarTransacao(
            context, 
            pIntentAction, 
            pUri
          );

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - OK");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.confirmarTransacao");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.success(true);

        } catch (Exception e) {

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - Exception");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.confirmarTransacao");
          System.out.println("| - Error: " + e.toString());
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.error(
            "Method: confirmarTransacao", 
            e.toString(), 
            false
          );          

        }

        break;

      // Metodo para Resolução de Penbdência via URI

      case "resolucaoPendencia":

        try {

          HashMap map = call.argument("args");

          String pIntentAction = (String) map.get("intentAction");
          String pUri = (String) map.get("requisicaoPendencia");
          String pUriConfirmacao = (String) map.get("requisicaoConfirmacao");

          resolucaoPendencia(
            context, 
            pIntentAction, 
            pUri,
                  pUriConfirmacao
          );

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - OK");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.resolucaoPendencia");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.success(true);

        } catch (Exception e) {

          System.out.println("\n");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| PaygoSdkPlugin - Exception");
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("| - Method: PaygoSdkPlugin.resolucaoPendencia");
          System.out.println("| - Error: " + e.toString());
          System.out.println("|- - - - - - - - - - - - - - - - - - - - - - ");
          System.out.println("\n");

          result.error(
            "Method: resolucaoPendencia", 
            e.toString(), 
            false
          );          

        }

        break;

    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivity() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
   context = binding.getActivity().getApplicationContext();
  }

  private void iniciaTransacao(
      Context context,
      String intentAction,
      Uri uri,
      String dadosAutomacao,
      String personalizacao) {

    // Documentação PayGO URI
    // Intent transacao = new Intent("br.com.setis.payment.TRANSACTION", uri);
    // transacao.putExtra("DadosAutomacao", dadosAutomacao);
    // transação.putExtra("Personalizacao", personalizacao);
    // transacao.putExtra("package", getPackageName());
    // transacao.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
    // startActivity(transacao);

    Intent transacao = new Intent(intentAction, uri);

    transacao.putExtra("DadosAutomacao", dadosAutomacao);
    transacao.putExtra("Personalizacao", personalizacao);
    transacao.putExtra("package", context.getPackageName());
    transacao.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);

    context.startActivity(transacao);

  }

  private void confirmarTransacao(
      Context context,
      String intentAction,
      String uriTransacao
    ) {

    // Documentação PayGO URI
    // Intent transacao = new Intent();
    // transacao.setAction("br.com.setis.confirmation.TRANSACTION");
    // transacao.putExtra("uri", uri);
    // transacao.addFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
    // sendBroadcast(transacao);

    Intent transacao = new Intent();

    transacao.setAction(intentAction);
    transacao.putExtra("uri", uriTransacao);
    transacao.setFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);

    context.sendBroadcast(transacao);

  }

  private void resolucaoPendencia(
      Context context,
      String intentAction,
      String uriPendencia,
      String uriConfirmacao) {

    // Documentação PayGO URI
    // Intent transacao = new Intent();
    // transacao.setAction("br.com.setis.confirmation.TRANSACTION");
    // transacao.putExtra("uri", uriPendencia);
    // transacao.putExtra("Confirmacao", "app://resolve/confirmation?transactionStatus=CONFIRMADO_AUTOMATICO");
    // transacao.addFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
    // sendBroadcast(transacao);

    Intent transacao = new Intent();
    transacao.setAction(intentAction);
    transacao.putExtra("uri",uriPendencia);
    transacao.putExtra("Confirmacao", uriConfirmacao);
    transacao.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK| Intent.FLAG_ACTIVITY_CLEAR_TASK);
    context.sendBroadcast(transacao);

  }

}
