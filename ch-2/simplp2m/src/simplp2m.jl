# simplp2m.jl - block-oriented version of SimpleLowPass.jl

module simplp2m

using DSP

N = 10							# length of test input signal
NB = trunc(Int, N/2) 			# block length
x = 1 : N 						# test input signal (integer ramp)
B = [1,1]						# feedforward coefficients
A = 1  							# feedback coefficients (no-feedback case)
sF = fill(0, NB)

y1 = filt!(sF,B,A,x[1:NB])					# process block 1
y2 = filt(B,A,x[NB+1:N],sF[1:1])			# process block 2

for i=1:NB			# print input and output for block 1
	println("x($i)=", x[i], "\t y($i)=", y1[i])
end

for i=NB+1:N		# print input and output for block 2
	println("x($i)=", x[i], "\t y($i)=", y2[i-NB])
end

end # module
