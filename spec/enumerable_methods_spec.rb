require './lib/enumerable'

describe Enumerable do
  let(:result) { [] }
  let(:input_array) { [-6,-4,9,1] }
  let(:range_values) { (-2..2) }
  let(:unsupported_range_values) { (1.5..5) }
  let(:proc_block) {proc { |elem| elem.positive? }}
  # let(:block_with_result) { proc { |elem| result << elem if elem.negative? } }

  describe '#my_each' do
   context 'no block is given' do
     it 'should return an enumerable' do
       expect(input_array.my_each).to be_a(Enumerator)
     end
   end
   context 'when block is given' do
    it 'should call block once for each element in an array, passing element as paramater' do
      input_array.my_each{ |elem| result << elem if elem.negative? }
      expect(result).to eql([-6,-4])
    end
    it 'should call block once for each sequence in range, passing element as paramater' do
      range_values.my_each{ |elem| result << elem if elem.negative? }
      expect(result).to eql([-2,-1])
    end
    it 'should return array when called on array' do
      expect(input_array.my_each{ proc_block }).to eql(input_array)
    end
    it 'should return range when called on range' do
      expect(range_values.my_each{ proc_block }).to eql(range_values)
    end
   end
 end

 describe '#my_each_with_index' do
  context 'no block is given' do
    it 'should return an enumerable' do
      expect(input_array.my_each_with_index).to be_a(Enumerator)
    end
  end
  context 'when block is given' do
    it 'should call block once for each element in an array, passing element as paramater' do
      input_array.my_each_with_index{ |elem| result << elem if elem.odd? }
      expect(result).to eql([1,3])
    end
    it 'should return array when called on array' do
      expect(input_array.my_each_with_index{ proc_block }).to eql(input_array)
    end
  end
 end

 describe '#my_select' do
   context 'no block is given' do
    it 'should return an enumerable' do
      expect(input_array.my_select).to be_a(Enumerator)
    end
   end
   context 'when block is given' do
    it 'should return a new array of elements for which the block returns true when called on array' do
      expect(input_array.my_select{ |elem| elem.positive? }).to eql([9,1])
    end
    it 'should return a new array of elements for which the block returns true when called on range' do
      expect(range_values.my_select{ |elem| elem.positive? }).to eql([1,2])
    end
   end
 end

 describe '#my_all?' do
   context 'when no block and no argument is given' do
    it 'should always return true if the block never returns false or nil' do
      expect(input_array.my_all?).to be_truthy
    end
    it 'should add implicit block which should return true when none of the collection items are false or nil (falsy)' do
       expect([nil, true, 99].my_all?).to be_falsy
     end
   end
   context 'when block is given' do
     it 'should pass each element of the collection to the given block and return true if the block never returns false or nil (falsy).' do
      expect(["ant", "bear", "cat"].my_all?{ |elem| elem.length > 2 }).to be_truthy
     end
     it 'should pass each element of the collection to the given block and return true if the block never returns false or nil (falsy).' do
      expect((-2..2).my_all?{ |elem| elem.is_a?(String) }).to be_falsy
     end
   end
   context 'when block and optional argument is given' do
     it 'should ignore block and return whether argument `===` element for every array member ' do
      expect(["ant", "bear", "cat"].my_all?(/v/){ |elem| elem.length > 2 }).to be_falsy
    end
    it 'should ignore block and return whether argument `===` element for every range member ' do
      expect((-2..2).my_all?(String){ |elem| elem.is_a?(Integer) }).to be_falsy
    end
   end
 end
 
 describe '#my_any?' do
   context 'when no block or optional argument is given' do
     it 'should add implicit block which should return true if at least one of the collection members is not false or nil.' do
      expect([nil, true, 99].my_any?).to be_truthy
    end
   end
   context 'when block is given' do
    it 'should pass each element of the collection to the given block and return true if the block ever returns a value.' do
      expect(["ant", 1, nil].my_any?{ |elem| elem.length > 2 }).to be_truthy
    end
    it 'should pass each element of the collection to the given block and return true if if the block ever returns a value.' do
      expect((-2..2).my_any?{ |elem| elem.is_a?(String) }).to be_falsy
    end
   end
   context 'when block and optional argument is given' do
    it 'should ignore block and return whether argument `===` element for every array member ' do
      expect(["ant", "bear", "cat"].my_any?(/v/){ |elem| elem.length > 2 }).to be_falsy
    end
    it 'should ignore block and return whether argument `===` element for every range member ' do
      expect((-2..2).my_all?(String){ |elem| elem.is_a?(Integer) }).to be_falsy
    end
   end
 end

 describe '#my_none?' do
   context 'when no block or optional argument is given' do
    it 'should add implicit block which should return false if at least one of the collection members is true(not falsy)' do
       expect([nil, false, true].my_none? ).to be_falsy
    end
   end
   context 'when block is given' do
    it 'should pass each element of the collection to the given block and return false if the block ever returns a truthy.' do
      expect(["ant", "bear", "cat"].my_none?{ |elem| elem.length >= 4 }).to be_falsy
    end
   end
   context 'when block and optional argument is given' do
    it 'should ignore block and return whether argument `===` element for every array member ' do
      expect([1, 3.14, 42].my_none?(Float){ |elem| elem > 2 }).to be_falsy
    end
    it 'should ignore block and return whether argument `===` element for every array member ' do
      expect(["ant", "bear", "cat"].my_none?(/d/){ |elem| elem.length > 2 }).to be_truthy
    end
   end
 end
 
 describe '#my_count' do
   context 'when block is not given' do
     it 'should return number of items in enum through enumeration' do
       expect(range_values.my_count).to eql(5)
     end
     it 'should return number of items in enum through enumeration' do
       expect(input_array.my_count).to eql(4)
     end
   end
   context 'when block is given' do
     it 'should return the number of elements in array for which the block is true' do
       expect(input_array.my_count{ |elem| elem.positive? }).to eql(2)
     end
     it 'should return the number of elements in range for which the block is true' do
      expect(range_values.my_count{ |elem| elem.positive? }).to eql(2)
    end
   end
   context 'when argument is given' do
     it 'should ignore block, return the number of items in enum that are equal to the args are counted' do
       expect([1,2,4,2, 2].my_count(2)).to eql(3)
     end
   end
 end

 describe '#my_inject' do
    context 'when no block is given' do
      it 'should raise a LocalJumpError' do
        expect { [2,4,5].my_inject }.to raise_error(LocalJumpError)
      end
    end
   context 'when block is given' do
     it 'it passes an accumulator value(memo) and each element in enum to the block' do
       expect([2,4,5].my_inject{ |acc, elem| acc * elem }).to eql(40)
     end
     it 'it passes an accumulator value(memo) and each element in enum to the block' do
      expect((5..10).my_inject{ |acc, elem| acc * elem }).to eql(151200)
    end
   end
   context 'when block is given and initial accumulator value(memo) is explicitly given' do
     it 'should set initialize accumulator with value given' do
      expect([2,4,5].my_inject(5){ |acc, elem| acc * elem }).to eql(200)
     end
   end
 end

 describe '#my_map' do
   context 'when no block is given' do
    it 'should return an enumerable' do
      expect(input_array.my_map).to be_a(Enumerator)
    end
   end
   context 'when block is given' do
     it 'should return an array' do
       expect(input_array.my_map { |elem| elem * elem }).to be_a(Array)
     end
     it 'it returns a new array containing the values returned by the block.' do
       expect((1..4).my_map { |i| i*i }).to eql([1, 4, 9, 16])
     end
   end
   context 'when a proc is given' do
    it 'should raise TypeError if optional argument provided is not a proc' do
      expect { input_array.my_map({}) }.to raise_error(TypeError)
    end
     it 'should ignore block and return a new array containing the values returned by the proc' do
      test_proc = Proc.new { |i| i* i }
      expect(input_array.my_map(&test_proc)).to eql([36, 16, 81, 1])
     end
   end
 end

end #end enumerable