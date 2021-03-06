describe "Conditional block components" do
  include CompilationSupport

  example "with neither identifier nor attributes" do
    define_presenter do
      def high?
        true
      end

      def low?
        false
      end
    end

    render("{{#high?}}yup{{/high?}}").should == "yup"
    render("{{#low?}}nah{{/low?}}").should == ""
  end

  example "with an identifier" do
    define_presenter do
      def even?(number)
        number.to_i % 2 == 0
      end
    end

    render("{{#even.42?}}even{{/even.42?}}").should == "even"
    render("{{#even.13?}}even{{/even.13?}}").should == ""
  end

  example "with attributes" do
    define_presenter do
      def square?(width:, height:)
        width.to_i == height.to_i
      end
    end

    render("{{#square? width=2 height=2}}square{{/square?}}").should == "square"
    render("{{#square? width=3 height=2}}square{{/square?}}").should == ""
  end
end
