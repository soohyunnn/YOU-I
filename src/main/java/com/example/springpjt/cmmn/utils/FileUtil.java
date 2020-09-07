package com.example.springpjt.cmmn.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.springpjt.cmmn.service.FileVO;

import egovframework.rte.fdl.idgnr.impl.Base64;

@Component(value="fileUtil")
public class FileUtil {

	public HashMap<String, Object> multipartRequestToMap(MultipartHttpServletRequest multiPartHttpServletRequest) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();


		Enumeration enumer = multiPartHttpServletRequest.getParameterNames();

		while(enumer.hasMoreElements()) {
			String key = (String)enumer.nextElement();
			resultMap.put(key, multiPartHttpServletRequest.getParameter(key));
		}

		return resultMap;
	}

	public List<FileVO> uploadFile(HttpServletRequest request, String uploadPath, String fileCheckType,
									String refType, String refCd) throws Exception {

		MultipartFile multipartFile = null;
		List<FileVO> fileList = new ArrayList<FileVO>();

		String oriFileNm = "";
		String oriFileNmExtension = "";
		String saveFileNm = "";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

		Iterator<String> iterator =  multipartHttpServletRequest.getFileNames();
		Map<String, MultipartFile> files = multipartHttpServletRequest.getFileMap();

		File file = new File(uploadPath);
		//업로드 경로가 존재하지 않으면 폴더 생성
		if(!file.exists()){
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = (MultipartFile) files.get(iterator.next());

			if (multipartFile.getSize() > 0) {
				oriFileNm = multipartFile.getOriginalFilename();
				oriFileNmExtension = oriFileNm.substring(oriFileNm.lastIndexOf("."));
				saveFileNm = UUID.randomUUID().toString().replaceAll("-", "") + oriFileNmExtension;
				//String fileSize = Long.toString(multipartFile.getSize());

				if(!checkFile(oriFileNmExtension, fileCheckType)){
					//throw new DataException("업로드가 불가능한 파일 입니다.");
					throw new Exception("업로드가 불가능한 파일 입니다.");
				}

				file = new File(uploadPath + saveFileNm);
				multipartFile.transferTo(file);

				FileVO fileVO = new FileVO();
				fileVO.setOriFileNm(oriFileNm);
				fileVO.setSaveFileNm(saveFileNm);
				fileVO.setUploadPath(uploadPath);
				fileVO.setRefType(refType);
				fileVO.setRefCd(refCd);

				fileList.add(fileVO);
			}
		}

		return fileList;
	}

	public List<FileVO> uploadFile(HttpServletRequest request, String uploadPath, String fileCheckType,
			boolean thumbnailFlag, Integer thumbWith, Integer thumbHeight, String refType, String refCd) throws Exception {

		MultipartFile multipartFile = null;
		List<FileVO> fileList = new ArrayList<FileVO>();

		String oriFileNm = "";
		String oriFileNmExtension = "";
		String saveFileNm = "";
		String thumbFileNm = "";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

		Iterator<String> iterator =  multipartHttpServletRequest.getFileNames();
		Map<String, MultipartFile> files = multipartHttpServletRequest.getFileMap();

		File file = new File(uploadPath);
		//업로드 경로가 존재하지 않으면 폴더 생성
		if(!file.exists()){
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = (MultipartFile) files.get(iterator.next());

			if (multipartFile.getSize() > 0) {
				oriFileNm = multipartFile.getOriginalFilename();
				oriFileNmExtension = oriFileNm.substring(oriFileNm.lastIndexOf("."));
				saveFileNm = UUID.randomUUID().toString().replaceAll("-", "") + oriFileNmExtension;
				//String fileSize = Long.toString(multipartFile.getSize());

				if(!checkFile(oriFileNmExtension, fileCheckType)){
					//throw new DataException("업로드가 불가능한 파일 입니다.");
					throw new Exception("업로드가 불가능한 파일 입니다.");
				}

				file = new File(uploadPath + saveFileNm);
				multipartFile.transferTo(file);

				//--섬네일 생성
				if(thumbnailFlag && thumbWith != null && thumbHeight != null){
					thumbFileNm = "thumb_" + saveFileNm;
					File thumbnailFile = new File(uploadPath+thumbFileNm);
					ThumbnailUtil.makeThumbnail(file, thumbnailFile, thumbWith, thumbHeight);
				}

				FileVO fileVO = new FileVO();
				fileVO.setOriFileNm(oriFileNm);
				fileVO.setSaveFileNm(saveFileNm);
				fileVO.setThumbFileNm(thumbFileNm);
				fileVO.setUploadPath(uploadPath);

				fileList.add(fileVO);
			}
		}

		return fileList;
	}

	private boolean checkFile(String fileExtension, String checkType){

		boolean fileCheck = false;

		//--체크할 파일 확장자
		String imageSuffix = "JPG|JPEG|GIF|PNG|BMP|";
		String excelSuffix = "XLSX|XLSM|XLSB|XLTX|XLTXM|XLS|XLT";
		String executeSuffix = "SH|EXE|BAT|ASP|JSP|PHP|JS|HTML|HTM|JAR|WAR|CLASS|JAVA|";

		checkType = checkType.toUpperCase();
		fileExtension = fileExtension.toUpperCase();

		if(checkType != null && checkType.equals("IMAGE")){
			if(imageSuffix.indexOf(fileExtension + "|") >= 0 ){
				fileCheck = true;
			}
		}else if(checkType != null && checkType.equals("EXCEL")){
			if(excelSuffix.indexOf(fileExtension + "|") >= 0 ){
				fileCheck = true;
			}
		}

		if(executeSuffix.indexOf(fileExtension + "|") < 0 ){
			fileCheck = true;
		}else{
			fileCheck = false;
		}


		return fileCheck;
	}

//화아이안 코나
	public boolean imageSizeCheck(MultipartHttpServletRequest multipartRequest, String fileName, int checkWidth, int checkHeight, String fileExt) throws Exception {

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		boolean sizeCheck = false;

		try {

			Map<String, MultipartFile> files = multipartRequest.getFileMap();

			MultipartFile mFile = (MultipartFile) files.get(fileName);

			if (mFile.getSize() > 0) {
				BufferedImage image = ImageIO.read(mFile.getInputStream());

				ImageIO.write(image, fileExt, baos);

				Integer imageWidth = image.getWidth();
				Integer imageHeight = image.getHeight();

				if(imageWidth == checkWidth && imageHeight == checkHeight) {
					sizeCheck = true;
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());

		} finally {

			baos.flush();
			baos.close();

		}

		return sizeCheck;
	}

	public String BlobToString(Blob blob, String fileExt) throws Exception {
		byte[] imageInByte = null;
		String str = "";

		BufferedImage image = ImageIO.read(blob.getBinaryStream());

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image, fileExt, baos);
		baos.flush();
		imageInByte = baos.toByteArray();
		baos.close();

		str = new String("data:image/jpg;base64, " + Base64.encode(imageInByte));

		return str;
	}

	public String getExtension(String n) {
		String extension = "";

		int i = n.lastIndexOf(".");
		int p = Math.max(n.lastIndexOf("/"), n.lastIndexOf("\\"));

		if(i>p) {
			extension = n.substring(i+1);
		}

		return extension;
	}


}
