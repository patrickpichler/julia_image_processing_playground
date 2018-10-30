using Images, TestImages

function do_edge_detection(sourceImage:: Array{GrayA{N0f8}, 2}, 
                           kernelSize::Int = 3) :: Array{GrayA{N0f8}, 2}
  return sourceImage
end

function build_kernels(kernelSize::Int) :: Array{UInt8, 2}
  if kernelSize & 1 == 0
    throw(ArgumentError("Kernel size must be odd"))
  end

  kernelBase = fill(-1, kernelSize, 1)
  kernelRows = [if (x == ceil(kernelSize/2)) 0 else -1 end for x in 1:kernelSize]

  kernelY = kernelBase * kernelRows

  (rotl90(kernelY), kernelY)
end


println(build_kernels(9))
