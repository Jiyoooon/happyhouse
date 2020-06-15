package com.ssafy.happyhouse.service;

import java.io.IOException;
import java.util.List;

import com.ssafy.happyhouse.dto.News;

public interface NewsService {
	public List<News> getNewsDatas() throws IOException ;

}
