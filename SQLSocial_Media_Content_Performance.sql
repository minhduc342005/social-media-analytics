-- kiểm tra dữ liệu dầu vào
select top 5 *
from posts

-- Câu 1 Nền tảng và loại bài đăng nào tạo ra lượt tương tác hoặc lượt xem cao nhất?
select [platform],[post_type], avg([engagement]) as avg_engagement
from [dbo].[posts]
group by [platform], [post_type]
order by avg_engagement desc

--"Instagram là nền tảng hoạt động hiệu quả nhất với trung bình 135.000 lượt tương tác, gần gấp đôi so với LinkedIn (85.000)."

-- Câu 2 Danh mục nội dung nào (ví dụ: quảng bá sản phẩm, giáo dục) mang lại hiệu quả tốt nhất ở các khu vực khác nhau?
select [content_category], [region], avg([engagement]) as avg_engagement
from [dbo].[posts]
group by [content_category], [region]
order by avg_engagement desc

-- "Bài đăng video thu hút trung bình 160.000 lượt tương tác — cao hơn gần 3 lần so với hình ảnh (58.000) và phát trực tiếp (56.000)."

-- Câu 3 Các chỉ số hiệu suất thay đổi như thế nào tùy theo nền tảng, định dạng bài đăng hoặc cách sử dụng hashtag?
select [main_hashtag], avg([engagement]) as avg_engagement, avg([impressions]) as avg_impressions
from [dbo].[posts]
group by  [main_hashtag]
order by  avg_impressions desc

-- "ProductDemo mang lại số lượt hiển thị cao nhất (trung bình 2,1 triệu) và mức độ tương tác cao nhất (trung bình 204 nghìn) — là hashtag hiệu quả nhất nói chung."

-- Câu 4 Ngày và giờ nào là lý tưởng nhất để đăng nội dung nhằm đạt được tương tác tối đa?
SELECT post_hour, day_of_week, AVG(engagement) AS avg_engagement
FROM posts
GROUP BY post_hour, day_of_week
ORDER BY avg_engagement DESC

-- Thời điểm tốt nhất để đăng bài là thứ Sáu lúc 6 giờ chiều để đạt được mức độ tương tác tối đa (173K)

-- Câu 5 Có sự khác biệt theo khu vực về hiệu suất tương tác và tỷ lệ click (CTR) không?
SELECT region, 
       ROUND(AVG(click_through_rate), 4) AS avg_ctr,
       ROUND(AVG(engagement), 0) AS avg_engagement
FROM posts
WHERE click_through_rate IS NOT NULL
GROUP BY region
ORDER BY avg_ctr DESC

--Đức có tỷ lệ CTR cao nhất (0,0191) — người dùng ở Đức có nhiều khả năng nhấp vào nội dung nhất, biến đây thành một thị trường có ý định mua hàng cao."

-- Câu 6 Những hashtag nào hiệu quả nhất trong việc tăng số lần hiển thị hoặc lượt click?
SELECT main_hashtag, 
       ROUND(AVG(impressions), 0) AS avg_impressions,
       ROUND(AVG(clicks), 0) AS avg_clicks
FROM posts
WHERE clicks IS NOT NULL
GROUP BY main_hashtag
ORDER BY avg_impressions DESC, avg_clicks desc 

-- TrendingNow dẫn đầu về số lượt hiển thị (2,3 triệu) nhưng MemeMonday thu hút nhiều lượt nhấp chuột hơn (43 nghìn) — ý định nhấp chuột cao hơn mặc dù phạm vi tiếp cận thấp hơn

-- Câu 7 Quốc gia hoặc khu vực nào liên tục có lượt xem video cao hoặc sự quan tâm lớn đến phát trực tiếp (live stream)?
select [region], round(avg([video_views]),0) as avg_video_views, round(avg([live_stream_views]),0) as avg_live_stream_views
from [dbo].[posts]
group by [region]
ORDER BY avg_video_views DESC, avg_live_stream_views DESC

-- "Nhật Bản dẫn đầu về lượt xem video (687K) trong khi Đức thống trị về lượt xem trực tiếp (127K) — cao hơn 30% so với bất kỳ khu vực nào khác."

-- Câu 8 Có sự tương quan nào giữa mức độ tương tác với danh mục nội dung hoặc thời gian đăng bài không
select  [content_category], [post_hour], avg([engagement]) as avg_engagement
from [dbo].[posts]
group by  [content_category], [post_hour]
ORDER BY content_category desc , avg_engagement DESC

-- Product Promotion lúc 8 giờ sáng tạo ra mức độ tương tác cao nhất (184K). Event/Webinar hoạt động tốt nhất lúc 3 giờ chiều 
-- phù hợp với thói quen đăng ký webinar vào buổi chiều của người dùng

-- Câu 9 Các loại nội dung tự nhiên (organic) so với nội dung được quảng cáo (promoted) khác nhau như thế nào về phạm vi tiếp cận và hiệu suất?
SELECT content_type,
       ROUND(AVG(engagement), 0) AS avg_engagement,
       ROUND(AVG([views]), 0) AS avg_views,
       ROUND(AVG([impressions]), 0) AS avg_impressions
FROM posts
GROUP BY [content_type]
ORDER BY avg_engagement DESC

-- Nội dung Sponsored vượt trội hơn Organic ở tất cả các chỉ số — tương tác cao hơn 14% (128K so với 112K) và số lần hiển thị cao hơn 17% (1.17M so với 1.00M). 
-- Tuy nhiên khoảng cách không quá lớn — nội dung Organic chất lượng cao vẫn hoàn toàn có thể cạnh tranh được.
