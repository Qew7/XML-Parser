require 'rexml/document'

class XMLParser
  include REXML

  def parse(file, xpath: nil, command: nil, optional: nil)
    xmlfile = File.read(file)
    @xmldoc = Document.new(xmlfile)
    case command
      when 'create'
        create_element(xpath, optional)
      when 'edit'
        edit_element(xpath, optional)
      when 'delete'
        delete_element(xpath)
      else
        show(xpath)
      end
    @xmldoc.write(File.open(file,"w"), 2)
  end

  private

  def create_element(xpath, content)
    new_el_name = xpath.split('/').last
    xpath["/#{new_el_name}"] = ''
    new_el_name.gsub!(/\[.*\]/, '')
    new_element = Element.new(new_el_name).add_text(Text.new(content))
    @xmldoc.root.elements.each_with_index(xpath) do |el, i|
      if el.has_elements?
        el.add_element(new_element)
      end
    end
  end

  def show(xpath)
    result = []
    @xmldoc.root.elements.each(xpath) do |el|
      if el.has_elements?
        result << el
      else
        result << el.text
      end
    end
    result    
  end

  def edit_element(xpath, content)
    @xmldoc.root.elements.each(xpath) do |el|
      if el.has_text?
        el.text = content
      end
    end
  end

  def delete_element(xpath)
    @xmldoc.delete_element(xpath)
  end
end
