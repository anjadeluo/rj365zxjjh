package cn.jade.rjzxjjh.utils.solr;


import cn.jade.rjzxjjh.model.HDFSSolrModel;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.client.solrj.impl.BinaryRequestWriter;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.ConnectException;
import java.util.Collection;
import java.util.List;

/**
 * Created by lenovo on 2015/11/20.
 */
public class SolrUtils {

    private static Logger logger = LoggerFactory.getLogger(SolrUtils.class);

    protected static String SOLR_URL;
    private static HttpSolrClient solrServer;

    private SolrUtils(String solr_url) {
        SOLR_URL = solr_url;
        if (solrServer == null) {
            solrServer = new HttpSolrClient(solr_url);
            solrServer.setConnectionTimeout(60000);
            solrServer.setSoTimeout(60000);
        }
    }

    /**
     * 添加多个bean
     *
     * @param beans
     */
    public static void addBeans(Collection beans) throws Exception {
        if (beans != null && beans.size() > 0) {
            try {
                solrServer.setAllowCompression(true);//数据压缩 传输更快
                solrServer.setConnectionTimeout(60000);
                solrServer.setSoTimeout(60000);
                solrServer.addBeans(beans.iterator());
                solrServer.optimize(); //time elasped 1176ms
                solrServer.commit();
            } catch (SolrServerException e) {
                e.printStackTrace();
                throw new Exception("引擎未启动");
            } catch (ConnectException e) {
                e.printStackTrace();
                throw new Exception("引擎未启动");
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("连接服务超时!");
            }
        }
    }

    /**
     * 添加单个bean
     *
     * @param bean
     */
    public static void addBean(Object bean) throws Exception {
        if (bean != null) {
            try {
                solrServer.setConnectionTimeout(60000);
                solrServer.setSoTimeout(60000);
                solrServer.addBean(bean);
                solrServer.optimize(); //time elasped 1176ms
                solrServer.commit();
            } catch (SolrServerException e) {
                e.printStackTrace();
                throw new Exception("引擎未启动");
            } catch (ConnectException e) {
                e.printStackTrace();
                throw new Exception("引擎未启动");
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("添加索引失败!");
            }
        }
    }

    /**
     * 根据条件删除document
     *
     * @param solrQuery 按该字段删除
     */
    public static void delByQuery(String solrQuery) throws Exception {
        try {
            solrServer.setConnectionTimeout(60000);
            solrServer.setSoTimeout(60000);
            solrServer.deleteByQuery(solrQuery);
            solrServer.commit();
        } catch (SolrServerException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (ConnectException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("删除索引失败!");
        }
    }

    /**
     * 查询document
     *
     * @param queryStr
     * @return
     */
    public static List<HDFSSolrModel> queryModel(String queryStr) throws Exception {
        QueryResponse response = null;
        List<HDFSSolrModel> modelList = null;
        if (StringUtils.isEmpty(queryStr)) {
            queryStr = "*:*";
        } else {
            queryStr = "keyword:" + queryStr;
        }

        SolrQuery query = new SolrQuery(queryStr);
        try {
            solrServer.setParser(new XMLResponseParser());
            solrServer.setRequestWriter(new BinaryRequestWriter());
            response = solrServer.query(query);
            SolrDocumentList solrDocumentList = response.getResults();
            modelList = SolrUtils.documentToSolrModel(solrDocumentList);
            return modelList;
        } catch (SolrServerException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (ConnectException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("搜索引擎未启动!");
        }
    }

    /**
     * 查询document
     *
     * @param query
     * @return
     */
    public static List<HDFSSolrModel> queryModel(SolrQuery query, HDFSSolrModel model) throws Exception {
        QueryResponse response = null;
        List<HDFSSolrModel> modelList = null;
        try {
            solrServer.setParser(new XMLResponseParser());
            solrServer.setRequestWriter(new BinaryRequestWriter());
            response = solrServer.query(query);
            SolrDocumentList solrDocumentList = response.getResults();
            modelList = SolrUtils.documentToSolrModel(solrDocumentList, model);
            return modelList;
        } catch (SolrServerException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (ConnectException e) {
            e.printStackTrace();
            throw new Exception("引擎未启动");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("搜索引擎未启动!");
        }
    }

    /**
     * 将document转换为JavaBean
     *
     * @param docs
     * @param model
     * @return
     */
    public static List documentToSolrModel(SolrDocumentList docs, HDFSSolrModel model) {
        if (docs == null) {
            return null;
        }
        DocumentObjectBinder binder = new DocumentObjectBinder();
        return binder.getBeans(model.getClass(), docs);
    }

    /**
     * 将document转换为JavaBean
     *
     * @param docs
     * @return
     */
    public static List documentToSolrModel(SolrDocumentList docs) {
        if (docs == null) {
            return null;
        }
        DocumentObjectBinder binder = new DocumentObjectBinder();
        return binder.getBeans(HDFSSolrModel.class, docs);
    }

    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8983/solr/collection1";
        HttpSolrClient solrServer = new HttpSolrClient(url);
        solrServer.setConnectionTimeout(60000);
        solrServer.setSoTimeout(60000);
        SolrQuery query = new SolrQuery("text:渔安");
        solrServer.setParser(new XMLResponseParser());
        solrServer.setRequestWriter(new BinaryRequestWriter());
        QueryResponse response = solrServer.query(query);
        System.out.println(response);
    }
}
