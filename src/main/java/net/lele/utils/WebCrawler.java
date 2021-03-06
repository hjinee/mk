package net.lele.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class WebCrawler {
	// 네이버 날씨 크롤링 메소드
	public Object getWeatherInfo() throws Exception {
		// 가져올 HTTP 주소 세팅
		HttpPost http = new HttpPost("https://weather.naver.com/today");

		// 가져오기를 실행할 클라이언트 객체 생성하기
		HttpClient httpClient = HttpClientBuilder.create().build();

		// 실행 및 실행 데이터를 Response 객체에 담음
		HttpResponse response = httpClient.execute(http);

		// Response 받는 데이터 중 DOM 데이터를 가져와 Entity에 담음
		HttpEntity entity = response.getEntity();

		// Charset을 알아내기 위해 DOM의 컨텐트 타입을 가져와서 담고 Charset을 가져옴
		ContentType contentType = ContentType.getOrDefault(entity);
		Charset charset = contentType.getCharset();

		// DOM 데이터를 한 줄씩 읽기 위해 BufferedReader에 담음 (inputStream / Buffered중 선택)
		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));

		// 가져온 DOM 데이터를 담기위해 StringBuffer 생성
		StringBuffer sb = new StringBuffer();

		// DOM 데이터 가져오기
		String line = "";
		while ((line = br.readLine()) != null) {
			sb.append(line + "\n");
		}

		// Jsoup으로 파싱하기
		Document doc = Jsoup.parse(sb.toString());

		// DOM 영역에서 #content 아이디를 사용하는 태그 선택
		Elements el = doc.select("#content");

		// el 엘리먼트 내용 중 .today_map 클래스를 사용하는 영역을 삭제
		el.select(".today_map").remove();

		return el;
	}
}
