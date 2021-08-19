package com.shop.mint.common.exception;

@SuppressWarnings("serial")
public class AttachFileException extends RuntimeException{
	public AttachFileException(String message) { //서에 물리적으로 파일을 생성하는 기능
		super(message);
	}

	public AttachFileException(String message, Throwable cause) {
		super(message, cause);
	}
}
