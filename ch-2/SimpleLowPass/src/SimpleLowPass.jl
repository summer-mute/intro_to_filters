# SimpleLowPass.jl - julia main program implementing
#					 the simplest lowpass filter:
#
#						y(n) = x(n)+x(n-1)

module SimpleLowPass

using DSP

N = 10				# length of test input signal
x = 1 : N 			# test input signal (integer ramp)
B = [1,1]			# transfer function numerator
A = 1 				# transfer function denominator

y = filt(B, A, x)



for i = 1 : N
	println("x($i)=", x[i], "\t y($i)=", y[i])
end

end # module
