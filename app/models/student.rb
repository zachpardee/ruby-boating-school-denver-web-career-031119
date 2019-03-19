class Student

  attr_accessor :first_name

  @@all = []

  def initialize(fist_name)
    @fist_name  = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status, instructor)
    BoatingTest.new(self, test_name, status, instructor)
  end

  def self.find_student(first_name)
    @@all.find do |student|
      first_name == student.first_name
    end
  end

  def passed_tests()
    self.tests.select do |test|
      test.status == "passed"
    end
  end

  def tests
    BoatingTest.select do |test|
      test.student == self
    end
  end

  def grade_percentage
    self.passed_tests.count.to_f / self.tests.count.to_f
  end
  
end
