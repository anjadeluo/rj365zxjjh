package cn.jade.rjzxjjh.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Service层公用的Exception, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 */
public class MyException extends RuntimeException {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private static final long serialVersionUID = 1L;

	public MyException() {
		super();
	}

	public MyException(String message) {
		super(message);
		logger.error(message);
	}

	public MyException(Exception e) {
		super(e.getMessage());
		logger.error(e.getMessage(),e);
	}

	public MyException(Throwable cause) {
		super(cause);
	}

	public MyException(String message, Throwable cause) {
		super(message, cause);
		logger.error(message);
	}
}
