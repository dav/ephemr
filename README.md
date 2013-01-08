###Ephemr###

This is a proof of concept for a better way to display photos that are intended to be ephemeral (cf Snapchat).

The intention is to obstruct the ability to make a copy of the displayed image either by taking a screenshot or to even take a photo of the display screen.

Ephemr uses a shifting mask to display only part of the photo at a time, forcing the human brain to reconstruct the various images.

This is a simple demo. The effect could be greatly improved by mask creation which aims to more intelligently obscure the underlying photo via color analysis.

###Example###

If you start with this image:

![Unmasked original image](https://raw.github.com/dav/ephemr/master/doc/before.jpg "Unmasked Screenshot")


Then the best screenshot you could take would be this:

![Masked image](https://raw.github.com/dav/ephemr/master/doc/after.jpg "Masked Screenshot")

However by shifting the mask rapidly as the user drags their finger on the screen, the underlying image can be made out easily by the human mind.

This is just a quickly kludged black grid mask. A more intelligent mask would use the colors of the underlying image to create a more altered image pattern.

Possibly other optical tricks could be employed as well. The basic idea is to use the brain's powerful imaging system to make sense of imperfect images.