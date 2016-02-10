def caddy_letsencrypt_arguments
  node['caddy']['email'] ? "-agree -email #{node['caddy']['email']}" : ''
end

class CaddyDocument
  def initialize
    @document = ''
  end

  def to_caddy(directive, content, level=0)
    if content.is_a? Hash
      output "#{directive} {", level
      content.each { |subdirective, subcontent| to_caddy(subdirective, subcontent, level + 1) }
      output '}', level
    elsif content.is_a? Array
      content.each do |subcontent|
        to_caddy(directive, subcontent, level)
      end
    elsif !content.nil? && !content.empty?
      output "#{directive} #{content}", level
    else
      output directive, level
    end
  end

  def output(content, level=0)
    @document << ('  ' * level) + content + "\n"
  end

  def to_s
    @document
  end
end
