# Julia Plotfixer
# Written by James Spicer, 11.29.2015, based on MATLAB Plot fixer by Matt Svrcek, 12.05.2001.

# TODO:
# Make everything work with 3d plots
# Actually changes the axes' thicknesses rather than just drawing a thick line at x, y = 0
# Legend() no longer responds to 'loc' commands.

# Run this script after generating the raw plots. It will find all open figures and adjust line sizes and text properties

# Change the following values to suit your preferences:
plotLSize           = 2             # Thickness of plotted lines [pt]
axisLSize           = 3             # Thickness of tick marks and borders [pt]
markerSize          = 8             # Size of line markers

axisFont            = "sans-serif"  # Options are "serif", "sans-serif", "cursive", "fantasy", or "monospace".
axisFontSize        = 12            # Options are "xx-small", "x-small", "small", "medium", "large", "x-large", "xx-large", or a pt font size, e.g. 12.
axisFontWeight      = "normal"      # Options are "ultralight", "light", "normal", "regular", "book", "medium", "roman", "semibold", "demibold", "demi", "bold", "heavy", "extra bold", or "black".
axisFontStyle       = "normal"      # Options are "normal", "italic", "oblique".
axisFontStretch     = "normal"      # Options are "ultra-condensed", "extra-condensed", "condensed", "semi-condensed", "normal", "semi-expanded", "expanded", "extra-expanded" or "ultra-expanded".
axisFontVariant     = "normal"      # Options are "normal" or "small-caps".
axisFontColor       = "k"

legendFont          = "sans-serif"  # Changes text in the legend
legendFontSize      = 12
legendFontWeight    = "normal"
legendFontStyle     = "normal"
legendFontStretch   = "normal"
legendFontVariant   = "normal"
legendFontColor     = "k"
legendRounded       = true
legendShadow        = false
legendScatterPoints = 1             # Number of scatter points to show in legend
legendPlotPoints    = 1             # Number of plotted points to show in legend

labelFont           = "sans-serif"  # Changes axis labels
labelFontSize       = 14
labelFontWeight     = "normal"
labelFontStyle      = "normal"
labelFontStretch    = "normal"
labelFontVariant    = "normal"
labelFontColor      = "k"

titleFont           = "sans-serif"   # Changes title
titleFontSize       = 14
titleFontWeight     = "normal"
titleFontStyle      = "normal"
titleFontStretch    = "normal"
titleFontVariant    = "normal"
titleFontColor      = "k"


# stop changing things below this line
# ----------------------------------------------------

for axesH in gcf()[:get_axes]()

    lineH = axesH[:get_lines]()
    setp(lineH, linewidth=plotLSize, markersize=markerSize)

    axesH[:axhline](linewidth=axisLSize, color="k")
    axesH[:axhline](axesH[:get_ylim]()[2], linewidth=axisLSize, color="k")
    axesH[:axvline](linewidth=axisLSize, color="k")
    axesH[:axvline](axesH[:get_xlim]()[2], linewidth=axisLSize, color="k")
    # z axis?

    axesH[:xaxis][:set_tick_params](length=1.5*axisLSize, width=0.5*axisLSize)
    axesH[:yaxis][:set_tick_params](length=1.5*axisLSize, width=0.5*axisLSize)
    # axesH[:zaxis][:set_tick_params](length=1.5*axisLSize, width=0.5*axisLSize)
    # axesH[:tick_params](axis="both", length=1.5*axisLSize, width=0.5*axisLSize)
    
    setp(axesH[:get_xticklabels](), family=axisFont, size=axisFontSize, weight=axisFontWeight, style=axisFontStyle, stretch=axisFontStretch, variant=axisFontVariant, color=axisFontColor)
    setp(axesH[:get_yticklabels](), family=axisFont, size=axisFontSize, weight=axisFontWeight, style=axisFontStyle, stretch=axisFontStretch, variant=axisFontVariant, color=axisFontColor)
    # setp(axesH[:get_zticklabels](), family=axisFont, size=axisFontSize, weight=axisFontWeight, style=axisFontStyle, stretch=axisFontStretch, variant=axisFontVariant, color=axisFontColor)

    axesH[:set_xlabel](axesH[:get_xlabel](), family=labelFont, size=labelFontSize, weight=labelFontWeight, style=labelFontStyle, stretch=labelFontStretch, variant=labelFontVariant, color=labelFontColor)
    axesH[:set_ylabel](axesH[:get_ylabel](), family=labelFont, size=labelFontSize, weight=labelFontWeight, style=labelFontStyle, stretch=labelFontStretch, variant=labelFontVariant, color=labelFontColor)
    # axesH[:set_zlabel](axesH[:get_zlabel](), family=labelFont, size=labelFontSize, weight=labelFontWeight, style=labelFontStyle, stretch=labelFontStretch, variant=labelFontVariant, color=labelFontColor)

    if typeof(axesH[:get_legend]()) != Void
        legendH = axesH[:legend](fancybox=legendRounded, shadow=legendShadow, scatterpoints=legendScatterPoints, numpoints=legendPlotPoints)
        setp(legendH[:get_texts](), family=legendFont, size=legendFontSize, weight=legendFontWeight, style=legendFontStyle, stretch=legendFontStretch, variant=legendFontVariant, color=legendFontColor)
    end

    axesH[:set_title](axesH[:get_title](), family=titleFont, size=titleFontSize, weight=titleFontWeight, style=titleFontStyle, stretch=titleFontStretch, variant=titleFontVariant, color=titleFontColor)
end