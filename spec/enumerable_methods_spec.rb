require './lib/enumerable'

describe Enumerable do
  let(:input_array) { [6,4,9,1] }
 describe '#my_each' do
   context 'no block is given' do
     it 'should return an enumerable' do
       expect(input_array.my_each).to be_a(Enumerator)
     end
   end
   context 'an array is given' do
     it 'should return an array' do
       
     end
   end
 end
end