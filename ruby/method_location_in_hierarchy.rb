#!/usr/bin/env ruby

def location_in_hierarchy(object,method)
  klss = object.class
  ancestors = [klss]
  while not (superclass = klss.superclass).nil?
    ancestors << superclass
    klss = superclass
  end
  ancestors.reverse.find do |ancestor|
    ancestor.instance_methods.include?(method)
  end
end

p location_in_hierarchy("string",:upto)
