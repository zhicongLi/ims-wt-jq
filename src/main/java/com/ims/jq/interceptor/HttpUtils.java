package com.ims.jq.interceptor;

import com.alibaba.fastjson.JSON;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;

import java.util.Map;

public class HttpUtils {

    public static String postJson(String url, Map<String, Object> map, String encoding, int timeout) {
        timeout = timeout == 0 ? 60000 : timeout;
        String r = "";
        // 创建默认的httpClient实例.
        HttpClient httpclient = new DefaultHttpClient();
        try {
            // 请求超时
            //   LogUtil.error(String.valueOf(httpclient.getParams()));
            httpclient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, timeout);
            // 读取超时
            httpclient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, timeout);
            HttpPost httppost = new HttpPost(url);
            httppost.addHeader("Content-Type", "application/json");
            String jsonstr = JSON.toJSONString(map);
            // 设置参数到请求对象中
            StringEntity se = new StringEntity(jsonstr, encoding);
            se.setContentType("text/json");
            se.setContentEncoding(new BasicHeader("Content-Type", "application/json"));
            httppost.setEntity(se);
            HttpResponse response = httpclient.execute(httppost);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                r = EntityUtils.toString(entity, encoding);
            }
        } catch (Exception ex) {
            //LogUtil.error(ex);
            ex.printStackTrace();
        } finally {
            // 关闭连接,释放资源
            httpclient.getConnectionManager().shutdown();
        }
        return r;
    }

}
