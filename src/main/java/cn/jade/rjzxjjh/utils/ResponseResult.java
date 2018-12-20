package cn.jade.rjzxjjh.utils;

import com.fasterxml.jackson.annotation.JsonInclude;

/*
 * 统一响应体
 * author:wxl
 * date:2017-7-8
 * */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class ResponseResult<T> {

	/* 是否成功 */
	private boolean success;

	public boolean getSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	/* 消息 */
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/* 返回结果数据 */
	private T data;

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	/*
	 * 错误编码, 共8位,前四位为缩写功能代号,后四位为错误编号.如果后四位全是0,表示操作执行正常.
	 */
	private String errorCode;

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public ResponseResult() {
	}
	
		
}
