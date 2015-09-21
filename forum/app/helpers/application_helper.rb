module ApplicationHelper
  def display_tree_recursive(tree, parent_id)

    ret = "<ul>"
    tree.each do |node|
      unless node.parent_id.to_i.zero?
        ret += "<li>"
        ret += yield node
        ret += display_tree_recursive(node, node.parent_id) { |n| yield n }
        ret += "</li>"
      else
        ret += "<li>"
        ret += link_to node.comment, node
        ret += "</li>"
      end

    end
    ret += "</ul>"
    ret.html_safe
  end

end
