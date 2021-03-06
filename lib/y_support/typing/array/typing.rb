#encoding: utf-8
class Array
  # === Duck typing support (aka. runtime assertions)

  # This method takes a block and fails with TypeError, if the receiver array
  # fails to include the specified element. An optional argument customizes the
  # error message (element description).
  # 
  def aT_includes element, what_is_self="array", what_is_element=nil
    m = "%s is absent from #{what_is_self}!" %
      if what_is_element then what_is_element.to_s.capitalize else
        "Element (#{element.class} instance)"
      end
    tap { include? element or fail TypeError, m }
  end
  alias :aT_include :aT_includes

  # Fails with TypeError if the array contains duplicates (using +#uniq+).
  # 
  def aT_uniq what_is_self="array"
    m = "#{what_is_self.to_s.capitalize} non-uniq!"
    tap { self == uniq or fail TypeError, m }
  end
end
