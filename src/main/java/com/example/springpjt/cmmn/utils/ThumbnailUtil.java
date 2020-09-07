package com.example.springpjt.cmmn.utils;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ThumbnailUtil {

	public static final int SAME = -1;
	public static final int RATIO = 0;

	public static void makeThumbnail(File src, File dest, int width, int height) throws IOException{
		FileInputStream srcIs = null;

		try {
			srcIs = new FileInputStream(src);
			ThumbnailUtil.makeThumbnail(srcIs, dest, width, height);
		} finally{
			if (srcIs != null){
				try {
					srcIs.close();
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
		}
	}

	public static void makeThumbnail(InputStream src, File dest, int width, int height) throws IOException {

		//--원본 이미지 정보 할당
		BufferedImage srcImg = ImageIO.read(src);

		//--원본 이미지 폭과 높이 설정
		int srcWidth = srcImg.getWidth();
		int srcHeight = srcImg.getHeight();

		int destWidth = -1;
		int destHeight = -1;

		if(width == SAME){
			destWidth = srcWidth;
		}else if (width > 0){
			destWidth = width;
		}

		if(height == SAME){
			destHeight = srcHeight;
		}else if (width > 0){
			destHeight = height;
		}

		if(width == RATIO && height == RATIO){
			destWidth = srcWidth;
			destHeight = srcHeight;
		}else if (width == RATIO){
			double ratio = ((double)destHeight) / ((double)destHeight);
			destWidth = (int)((double)srcWidth * ratio);
		}else if (height == RATIO){
			double ratio = ((double)destWidth) / ((double)destWidth);
			destHeight = (int)((double)srcHeight * ratio);
		}

		//--새로 생성할 이미지 정보 할당
		BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);

		//--썸네일 이미지 그리기
		Graphics2D g = destImg.createGraphics();
		g.drawImage(srcImg, 0, 0, destWidth, destHeight, null);

		//--이미지 생성
		ImageIO.write(destImg, "png", dest);
	}
}
