package cn.jade.rjzxjjh.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * 图片通用工具类
 * Created by zhanghe on 2015/7/6.
 */
public class ImageUtils {
    private static Logger logger = LoggerFactory.getLogger(ImageUtils.class);


    /**
     * 复制图片
     *
     * @param fromPath 原图片路径
     * @param toPath   复制图片的路径
     * @return
     */
    public static boolean copyImage(String fromPath, String toPath) {
        return copyImage(fromPath, toPath, 1);
    }

    /**
     * 复制图片
     *
     * @param fromPath 原图片路径
     * @param toPath   复制图片的路径
     * @param multiple 图片放大缩小的倍数, 长宽等比例放大缩小
     * @return
     */
    public static boolean copyImage(String fromPath, String toPath, Integer multiple) {
        try {
            fromPath = StringUtils.convertPath(java.net.URLDecoder.decode(fromPath, "UTF-8"));
            toPath = StringUtils.convertPath(java.net.URLDecoder.decode(toPath, "UTF-8"));
            String suffixName = toPath.substring(toPath.lastIndexOf(".") + 1);
            toPath = StringUtils.convertPath(toPath);
            File file = new File(fromPath);
            if (file == null || !file.isFile()) {
                return false;
            } else {
                //要拷贝的图片
                Image image = ImageIO.read(file);
                int width = image.getWidth(null);   //图片原宽度
                int height = image.getHeight(null); //图片原高度
                Map<String, Integer> map = calcRatio(width, height, multiple);
                int toImgWidth = map.get("width");   //图片压缩后的宽度
                int toImgHeight = map.get("height"); //图片压缩后的高度
                BufferedImage imageTag = new BufferedImage(toImgWidth, toImgHeight, BufferedImage.TYPE_INT_RGB);
                //imageTag.getGraphics().drawImage(image, 0, 0, toImgWidth, toImgHeight, null);
                imageTag.getGraphics().drawImage(image.getScaledInstance(toImgWidth, toImgHeight, Image.SCALE_SMOOTH), 0, 0, null);

                mkDirs(toPath);

                ImageIO.write(imageTag, suffixName, new File(toPath));
                return true;
            }
        } catch (FileNotFoundException fe) {
            fe.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    /**
     * 复制图片
     *
     * @param fromPath 原图片路径
     * @param toPath   复制图片的路径
     * @param maxWidth  图片宽度最大限制
     * @param maxHeight 图片高度最大限制
     * @return
     */
    public static boolean copyImage(String fromPath, String toPath, Integer maxWidth, Integer maxHeight) {
        try {
            fromPath = StringUtils.convertPath(java.net.URLDecoder.decode(fromPath, "UTF-8"));
            toPath = StringUtils.convertPath(java.net.URLDecoder.decode(toPath, "UTF-8"));
            String suffixName = toPath.substring(toPath.lastIndexOf(".") + 1);
            toPath = StringUtils.convertPath(toPath);
            File file = new File(fromPath);
            if (file == null || !file.isFile()) {
                return false;
            } else {
                //要拷贝的图片
                Image image = ImageIO.read(file);
                int width = image.getWidth(null);   //图片原宽度
                int height = image.getHeight(null); //图片原高度
                Map<String, Integer> map = calcRatio(width, height, maxWidth, maxHeight);
                int toImgWidth = map.get("width");   //图片压缩后的宽度
                int toImgHeight = map.get("height"); //图片压缩后的高度
                BufferedImage imageTag = new BufferedImage(toImgWidth, toImgHeight, BufferedImage.TYPE_INT_RGB);
                //imageTag.getGraphics().drawImage(image, 0, 0, toImgWidth, toImgHeight, null);
                imageTag.getGraphics().drawImage(image.getScaledInstance(toImgWidth, toImgHeight, Image.SCALE_SMOOTH), 0, 0, null);
                mkDirs(toPath);

                ImageIO.write(imageTag, suffixName, new File(toPath));
                return true;
            }
        } catch (FileNotFoundException fe) {
            fe.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    /**
     * 复制图片
     *
     * @param inputStream  原图片流
     * @param suffixName   图片格式
     * @param maxWidth  图片宽度最大限制
     * @param maxHeight 图片高度最大限制
     * @return
     */
    public static InputStream copyImage(InputStream inputStream, String suffixName, Integer maxWidth, Integer maxHeight) {
        InputStream is = null;
        try {
            //要拷贝的图片
            BufferedImage image = ImageIO.read(inputStream);
            if(image != null) {
                int width = image.getWidth(null);   //图片原宽度
                int height = image.getHeight(null); //图片原高度
                Map<String, Integer> map = calcRatio(width, height, maxWidth, maxHeight);
                int toImgWidth = map.get("width");   //图片压缩后的宽度
                int toImgHeight = map.get("height"); //图片压缩后的高度
                BufferedImage imageTag = new BufferedImage(toImgWidth, toImgHeight, BufferedImage.TYPE_INT_RGB);
                //imageTag.getGraphics().drawImage(image, 0, 0, toImgWidth, toImgHeight, null);
                imageTag.getGraphics().drawImage(image.getScaledInstance(toImgWidth, toImgHeight, Image.SCALE_SMOOTH), 0, 0, null);
                //创建储存图片二进制流的输出流
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                //创建ImageOutputStream流
                ImageOutputStream imageOutputStream = ImageIO.createImageOutputStream(baos);
                //将二进制数据写进ByteArrayOutputStream
                ImageIO.write(imageTag, suffixName, imageOutputStream);
                is = new ByteArrayInputStream(baos.toByteArray());
            }
        } catch (FileNotFoundException fe) {
            fe.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return is;
    }

    /**
     * 按指定比例计算图片压缩后的宽高度
     *
     * @param width    原宽度
     * @param height   原高度
     * @param multiple 压缩倍数  压缩后的值为  原高度/multiple 或 原宽度/multiple
     * @return
     */
    public static Map<String, Integer> calcRatio(Integer width, Integer height, float multiple) {
        Map<String, Integer> map = new HashMap();
        if (multiple == 1) {
            map.put("width", width);
            map.put("height", height);
            return map;
        }
        float toImgWidth = width;   //图片压缩后的宽度
        float toImgHeight = height; //图片压缩后的高度
        if (width > height)  //如果宽度超过高度以宽度为准来压缩
        {
            toImgWidth = width / multiple;   //图片压缩后的宽度
            toImgHeight = height / (float) (width / toImgWidth); //图片压缩后的高度
        } else {
            toImgHeight = height / multiple; //图片压缩后的高度
            toImgWidth = width / (float) (height / toImgHeight);   //图片压缩后的宽度
        }
        map.put("width", (int) toImgWidth);
        map.put("height", (int) toImgHeight);
        return map;
    }

    /**
     * 指定图片最大宽高度计算图片压缩后的宽高度
     *
     * @param width     原宽度
     * @param height    原高度
     * @param maxWidth  图片宽度最大限制
     * @param maxHeight 图片高度最大限制
     * @return
     */
    public static Map<String, Integer> calcRatio(Integer width, Integer height, Integer maxWidth, Integer maxHeight) {
        Map<String, Integer> map = new HashMap();
        float toImgWidth = width;   //图片压缩后的宽度
        float toImgHeight = height; //图片压缩后的高度
        if (width > height)  //如果宽度超过高度以宽度为准来压缩
        {
            if (width > maxWidth)  //如果图片宽度超过限制
            {
                toImgWidth = maxWidth;   //图片压缩后的宽度
                toImgHeight = height / (float) (width / toImgWidth); //图片压缩后的高度
            }
        } else {
            if (height > maxHeight) {
                toImgHeight = maxHeight;
                toImgWidth = width / (float) (height / toImgHeight);
            }
        }
        map.put("width", (int) toImgWidth);
        map.put("height", (int) toImgHeight);
        return map;
    }

    /**
     * base64 转图片
     *
     * @param base64String base64字符串
     * @param filePath     图片路径
     */
    public static boolean base64StringToImage(String base64String, String filePath) {
        try {
            if(!StringUtils.containsIgnoreCase(filePath,SystemPath.getSysPath())){
                filePath =  SystemPath.getSysPath() + File.separator + filePath;
            }
            filePath = StringUtils.convertPath(filePath);
            return generateImage(base64String, filePath);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * base64 转图片
     *
     * @param base64String base64字符串
     */
    public static InputStream base64StringToInputStream(String base64String) {
        try {
            return new ByteArrayInputStream(base64StringToByte(base64String));
        } catch (Exception e) {
            e.printStackTrace();
            return  null;
        }
    }

    /**
     * 图片转文件流
     *
     * @param image 图片
     */
    public static InputStream BufferedImageToInputStream(BufferedImage image) {
        try {
            return new ByteArrayInputStream(BufferedImage2Byte(image));
        } catch (Exception e) {
            e.printStackTrace();
            return  null;
        }
    }

    /**
     * byte 转图片
     *
     * @param bytes    图片二进制
     * @param filePath 图片路径
     */
    public static boolean byteToImage(byte[] bytes, String filePath) {
        if (bytes == null || bytes.length < 1) {
            return false;
        }
        try {
            filePath = StringUtils.convertPath(java.net.URLDecoder.decode(filePath, "UTF-8"));
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
            BufferedImage bi1 = ImageIO.read(bais);

            mkDirs(filePath);

            File w2 = new File(filePath);//可以是jpg,png,gif格式
            ImageIO.write(bi1, "jpeg", w2);//不管输出什么格式图片，此处不需改动
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void mkDirs(String filePath) {
        filePath = StringUtils.convertPath(filePath);
        String dir = filePath.substring(0, filePath.lastIndexOf(File.separator));
        File toFile = new File(dir);
        if (!toFile.exists()) {
            toFile.mkdirs();
        }
    }

    /**
     * base64 转 byte
     *
     * @param base64String base64字符串
     */
    public static byte[] base64StringToByte(String base64String) {
        try {
            if (StringUtils.isBlank(base64String)) {
                return null;
            }
            if (base64String.startsWith("data:image")) {
                base64String = base64String.substring(base64String.indexOf("base64,") + "base64,".length());
            }
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] bytes = decoder.decodeBuffer(base64String);
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 将  BufferedImage 转 Base64
     *
     * @param image
     */
    public static byte[] BufferedImage2Byte(BufferedImage image) {
        try {
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            ImageOutputStream imOut = ImageIO.createImageOutputStream(bs);
//            ImageIO.write(image, "jpeg", imOut);
            ImageIO.write(image, "png", imOut);
            InputStream in = new ByteArrayInputStream(bs.toByteArray());
            byte[] data = new byte[in.available()];
            in.read(data);
            in.close();
            bs.close();
            bs = null;
            imOut.close();
            imOut = null;
            return data;
        } catch (IOException e) {
            e.printStackTrace();
            logger.debug("Exception--" + e.getMessage());
            return null;
        } catch (Exception e) {
            logger.debug("Exception--" + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 将  BufferedImage 转 Base64
     *
     * @param image
     */
    public static String BufferedImage2Base64(BufferedImage image) {
        try {
            BASE64Encoder encoder = new BASE64Encoder();
//            return "data:image/jpeg;base64," + EncodesUitls.encodeBase64(BufferedImage2Byte(image));
//            return "data:image/png;base64," + EncodesUitls.encodeBase64(BufferedImage2Byte(image));
            return "data:image/png;base64," + encoder.encodeBuffer(BufferedImage2Byte(image));
        } catch (Exception e) {
            logger.debug("Exception--" + e.getMessage());
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 图片 转 byte
     *
     * @param file 图片
     */
    public static byte[] imageToByte(File file) {
        try {
            if (file == null || !file.isFile()) {
                return null;
            } else {
                //要拷贝的图片
                Image image = ImageIO.read(file);
                int width = image.getWidth(null);   //图片原宽度
                int height = image.getHeight(null); //图片原高度
                BufferedImage imageTag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                imageTag.getGraphics().drawImage(image, 0, 0, width, height, null);
                return BufferedImage2Byte(imageTag);
            }
        } catch (FileNotFoundException fe) {
            fe.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 图片 转 Base64
     *
     * @param file 图片
     */
    public static String imageToBase64(File file) {
        try {
            if (file == null || !file.isFile()) {
                return null;
            } else {
                //要拷贝的图片
                Image image = ImageIO.read(file);
                int width = image.getWidth(null);   //图片原宽度
                int height = image.getHeight(null); //图片原高度
                BufferedImage imageTag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                imageTag.getGraphics().drawImage(image, 0, 0, width, height, null);
                return BufferedImage2Base64(imageTag);
            }
        } catch (FileNotFoundException fe) {
            fe.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Byte 转 Base64
     *
     * @param bytes 图片
     */
    public static String byteToBase64(byte[] bytes) {
        if (bytes == null || bytes.length < 1) {
            return null;
        }
        try {
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
            BufferedImage bi1 = ImageIO.read(bais);
            return BufferedImage2Base64(bi1);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @Description: 将base64编码字符串转换为图片
     * @Author:
     * @CreateTime:
     * @param imgStr base64编码字符串
     * @param path 图片路径-具体到文件
     * @return
     */
    public static boolean generateImage(String imgStr, String path) {
        try {
            OutputStream out = new FileOutputStream(path);
            out.write(base64StringToByte(imgStr));
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }



    /**
     * 文件流转图片
     *
     * @param is 文件流
     * @param relPath 图片路径
     */
    public static boolean inputstreamToFile(InputStream is,String relPath) {
        boolean flag = true;
        OutputStream os;
        try {
            String absPath = StringUtils.convertPath(SystemPath.getSysPath() + File.separator + relPath);
            ImageUtils.mkDirs(absPath);
            File file = new File(absPath);
            os = new FileOutputStream(file);
            byte[] data = new byte[1024];
            int nt=0;
            while((nt=is.read(data))!=-1)
            {
                os.write(data, 0, nt);//输出到指定文件
            }
            os.close();
            is.close();
        } catch (Exception e) {
            flag = false;
            e.printStackTrace();
        }finally {
            return  flag;
        }
    }
}
