class Importer
  def self.get src, link
    require 'mechanize'
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    
    case src.to_sym
    when :kinopod
      url = Importer.get_kinopod agent, link
    end
    
    return url
  end
  
  def self.get_kinopod agent, link
    script = nil
    agent.get(link)
    agent.page.search("script").each do |s|
      script = s if s.content.include?('player.addVariable')
    end
    sub_url = script.content[/player\.addVariable\(\'file\'\, \'(.*?)\'\)\;/]
    url = sub_url.gsub(/(.*?)\(\'file\'\, \'(.*?)\'\)\;(.*?)/, "\\2")
    #url = "http://peach.blender.org/wp-content/uploads/big_big_buck_bunny.jpg"
    title = agent.page.search("h1").first
    return { :url => url, :title => title.text }
  end
  
  
end