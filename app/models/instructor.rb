class Instructor

  attr_reader :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name

    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name)
    self.grade_student(student, test_name, "passed")
  end

  def fail_student(student, test_name)
    self.grade_student(student, test_name, "failed")
  end

  def grade_student(student, test_name, status)
    valid_test = BoatingTest.all.find do |test|
      test.student == student && test.test_name == test_name
    end
    if (valid_test)
      valid_test.status = status
      valid_test
    else
      BoatingTest.new(student, test_name, status, self)
    end
  end
end
