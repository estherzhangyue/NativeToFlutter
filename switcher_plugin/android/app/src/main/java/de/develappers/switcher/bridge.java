// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package de.develappers.switcher;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class bridge {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  /**
   * The communication object, this object will be used in dart and in native code
   * encoding and decoding the data will be done automatically
   *
   * Generated class from Pigeon that represents data sent in messages.
   */
  public static final class RouteEntry {
    private @NonNull String destination;

    public @NonNull String getDestination() {
      return destination;
    }

    public void setDestination(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"destination\" is null.");
      }
      this.destination = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    RouteEntry() {}

    public static final class Builder {

      private @Nullable String destination;

      public @NonNull Builder setDestination(@NonNull String setterArg) {
        this.destination = setterArg;
        return this;
      }

      public @NonNull RouteEntry build() {
        RouteEntry pigeonReturn = new RouteEntry();
        pigeonReturn.setDestination(destination);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(1);
      toListResult.add(destination);
      return toListResult;
    }

    static @NonNull RouteEntry fromList(@NonNull ArrayList<Object> list) {
      RouteEntry pigeonResult = new RouteEntry();
      Object destination = list.get(0);
      pigeonResult.setDestination((String) destination);
      return pigeonResult;
    }
  }
  /**
   * This interface will be used to send data from native to dart, in this case
   * the native code will send the current state of the switcher
   *
   * Generated class from Pigeon that represents Flutter messages that can be called from Java.
   */
  public static class FApi {
    private final @NonNull BinaryMessenger binaryMessenger;

    public FApi(@NonNull BinaryMessenger argBinaryMessenger) {
      this.binaryMessenger = argBinaryMessenger;
    }

    /** Public interface for sending reply. */ 
    @SuppressWarnings("UnknownNullness")
    public interface Reply<T> {
      void reply(T reply);
    }
    /** The codec used by FApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return new StandardMessageCodec();
    }
    public void currentState(@NonNull String pageArg, @NonNull Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.switcher.FApi.currentState", getCodec());
      channel.send(
          new ArrayList<Object>(Collections.singletonList(pageArg)),
          channelReply -> callback.reply(null));
    }
  }

  private static class HApiCodec extends StandardMessageCodec {
    public static final HApiCodec INSTANCE = new HApiCodec();

    private HApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return RouteEntry.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof RouteEntry) {
        stream.write(128);
        writeValue(stream, ((RouteEntry) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /**
   * This interface will be used to send data from dart to native, in this case
   * the dart code will send a history entry to the native code to be added to
   * the history list
   *
   * Generated interface from Pigeon that represents a handler of messages from Flutter.
   */
  public interface HApi {

    void jumpToRoute(@NonNull RouteEntry entry);

    /** The codec used by HApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return HApiCodec.INSTANCE;
    }
    /**Sets up an instance of `HApi` to handle messages through the `binaryMessenger`. */
    static void setup(@NonNull BinaryMessenger binaryMessenger, @Nullable HApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.switcher.HApi.jumpToRoute", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                RouteEntry entryArg = (RouteEntry) args.get(0);
                try {
                  api.jumpToRoute(entryArg);
                  wrapped.add(0, null);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}