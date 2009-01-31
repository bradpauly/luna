xml.instruct!
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title @feed_title
    xml.link @feed_url
    xml.description @feed_description
    xml.language "en-us"

    for post in @posts
      xml.item do
        xml.pubDate post.created_at.rfc822
        xml.title h(post.title)
        xml.link post_url( post )
        xml.guid post_url( post )
        xml.description rc( post.body )
      end
    end
  end
end