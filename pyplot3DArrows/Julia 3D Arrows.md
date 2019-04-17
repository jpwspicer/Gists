# Julia implementation of 3D Arrows in Matplotlib

### Original Python implementation (from [this](http://stackoverflow.com/a/11156353) StackOverflow post):

The `Arrow3D` class is defined:

```python 
from matplotlib.patches import FancyArrowPatch
from mpl_toolkits.mplot3d import proj3d

class Arrow3D(FancyArrowPatch):
    def __init__(self, xs, ys, zs, *args, **kwargs):
        FancyArrowPatch.__init__(self, (0,0), (0,0), *args, **kwargs)
        self._verts3d = xs, ys, zs

    def draw(self, renderer):
        xs3d, ys3d, zs3d = self._verts3d
        xs, ys, zs = proj3d.proj_transform(xs3d, ys3d, zs3d, renderer.M)
        self.set_positions((xs[0],ys[0]),(xs[1],ys[1]))
        FancyArrowPatch.draw(self, renderer)
```

And called: 

```python
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.gca(projection='3d')
ax.set_aspect("equal")

a = Arrow3D([0,1],[0,1],[0,1], mutation_scale=20, lw=1, arrowstyle="-|>", color="k")
ax.add_artist(a)
plt.show()
```

![Python 3D Arrow Implementation](https://raw.githubusercontent.com/jpwspicer/Gists/master/pyplot3DArrows/3DarrowPython.png "Python 3D Arrow Implementation")

### Julia Implementation

In Julia, the 'class' is defined:

```julia
using PyCall, PyPlot
patch = pyimport("matplotlib.patches")
proj3d = pyimport("mpl_toolkits.mplot3d.proj3d")

@pydef mutable struct Arrow3D <: patch.FancyArrowPatch
    __init__(self, xs, ys, zs; kwargs...) = begin
        patch.FancyArrowPatch.__init__(self, (0,0), (0,0); kwargs...)
        self._verts3d = xs, ys, zs
    end

    draw(self, renderer) = begin
        xs3d, ys3d, zs3d = self._verts3d
        xs, ys, zs = proj3d.proj_transform(xs3d, ys3d, zs3d, renderer.M)
        self.set_positions((xs[1],ys[1]),(xs[2],ys[2]))
        patch.FancyArrowPatch.draw(self, renderer)
    end
end
```

And called:
```julia
a = Arrow3D([0,1],[0,1],[0,1], mutation_scale=20, lw=1, arrowstyle="-|>", color="k")
ax = subplot(projection = "3d")
ax.add_artist(a)
```

![Julia 3D Arrow Implementation](https://raw.githubusercontent.com/jpwspicer/Gists/master/pyplot3DArrows/3DarrowJulia.png "Julia 3D Arrow Implementation")

The following function calls the above Julia 'class' to draw an arrow between 3D points `p1` and `p2`.

```julia
function draw3DArrow(p1, p2; ax=subplot(projection = "3d"), size=20, kwargs...)
    a = Arrow3D([p1[1],p2[1]],[p1[2],p2[2]],[p1[3],p2[3]]; mutation_scale=size, kwargs...)
    ax.add_artist(a)
end
```