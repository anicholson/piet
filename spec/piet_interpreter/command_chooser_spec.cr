require "../spec_helper"

module PietInterpreter
  describe CommandChooser do
    describe ".call" do
      let(subject, Commands::Command) { CommandChooser.call(hue_change, light_change) }
      describe "with hue change 0" do
        let(hue_change) { 0 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Noop
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Push
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Pop
          end
        end
      end

      describe "with hue change 1" do
        let(hue_change) { 1 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Add
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Subtract
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }
          it "returns the correct command" do
            subject.must_be_instance_of Commands::Multiply
          end
        end
      end
      describe "with hue change 2" do
        let(hue_change) { 2 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Divide
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }
          it "returns the correct command" do
            subject.must_be_instance_of Commands::Mod
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Not
          end
        end
      end
      describe "with hue change 3" do
        let(hue_change) { 3 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Greater
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Pointer
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Switch
          end
        end
      end
      describe "with hue change 4" do
        let(hue_change) { 4 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Dup
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::Roll
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::InDigit
          end
        end
      end
      describe "with hue change 5" do
        let(hue_change) { 5 }
        describe "with lightness change 0" do
          let(light_change) { 0 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::InChar
          end
        end
        describe "with lightness change 1" do
          let(light_change) { 1 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::OutDigit
          end
        end
        describe "with lightness change 2" do
          let(light_change) { 2 }

          it "returns the correct command" do
            subject.must_be_instance_of Commands::OutChar
          end
        end
      end
    end
  end
end
