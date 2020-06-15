package com.ssafy.happyhouse.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.News;

@Service
public class NewsServiceImpl implements NewsService {

	private static Date date = new Date();
	private static SimpleDateFormat dateform = new SimpleDateFormat("yyyyMMdd");
	private static String news_url = "https://news.naver.com/main/ranking/popularDay.nhn?rankingType=popular_day&sectionId=101&date="+dateform.format(date);

	@PostConstruct
	public List<News> getNewsDatas() throws IOException {
		
		List<News> newslist = new ArrayList<News>();
		
		Document doc = Jsoup.connect(news_url).get();
//		System.out.println(doc);
		Elements imglinks = doc.select("div[class=ranking_thumb] a img");
		Elements title_links = doc.select("div[class=ranking_headline] a");
		Elements summarys = doc.select("div[class=ranking_lede]");
		Elements companys = doc.select("div[class=ranking_office]");
//		System.out.println(news_url);
		for (int i = 0; i < imglinks.size(); i++) {
			String imglink = imglinks.get(i).attr("src");
			String title = title_links.get(i).attr("title");
			String link = title_links.get(i).attr("abs:href");
			String summary = summarys.get(i).text();
			String company = companys.get(i).text();
			News news = new News(imglink, title, link, summary,company); 
			newslist.add(news);
//			System.out.println(news.toString());
		}
//		for (Element element : content) {
//			String imglink = element.select("div[class=ranking_thumb] a img").attr("src");
//			String title = element.select("div[class=ranking_headline] a").attr("title");
//			String link = element.select("div[class=ranking_headline] a").attr("abs:href");
//			String summary = element.select("div[class=ranking_lede]").text();
//			String company = element.select("div[class=ranking_office]").text();
//			News news = new News(imglink, title, link, summary,company);
//			newslist.add(news);
//			System.out.println(news.toString());
//		}
		
//		System.out.println(content);
//		System.out.println(newslist.size());
		return newslist;
	}
}
