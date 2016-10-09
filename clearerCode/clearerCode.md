# The Essentials of Clearer Code

An increasing number of computer lanuages are making use of unicode symbols, offering the tantalizing possibility of elegant, easy-to-read code that's a pleasure, rather than a pain, for untrained humans to read and debug.

#### Contents

<ul>
<li><a href="#problem">Problem</a></li>
<li><a href="#solution">Solution</a></li>
	<ol  type="1">
		<li><a href="#enableFonts">Enable Unicode Fonts</a></li>
		<li><a href="#autoCompletions">Auto-Completions</a></li>
	</ol>
<li><a href="#appendices">Appendices</a></li>
	<ol  type="1">
		<li><a href="#fontComparisons">Fixed-Width Font Comparison</a></li>
		<li><a href="#changeFonts">Change Default Fonts</a></li>
			<ol type="a">
				<li><a href="#browsers">Browsers</a></li>
					<ol type="i">
						<li><a href="#chrome">Chrome</a></li>
						<li><a href="#firefox">Firefox</a></li>
						<li><a href="#safari">Safari</a></li>
					</ol>
				<li><a href="#shell">Shells</a></li>
					<ol type="i">
						<li><a href="#osx">OSX Terminal</a></li>
						<li><a href="#windows">Windows Command Prompt</a></li>
						<li><a href="#linux">Linux Shell</a></li>
					</ol>
			</ol>
		<li><a href="#autoCompletionImplementation">Auto-Completion Implementations</a></li>
			<ol type="a">
				<li><a href="#os">Operating System-Wide</a></li>
					<ol type="i">
						<li><a href="#osxImp">OSX</a></li>
						<li><a href="#windowsImp">Windows</a></li>
					</ol>
				<li><a href="#textEditors">Text Editors</a></li>
					<ol type="i">
						<li><a href="#sublime">Sublime Text</a></li>
						<li><a href="#notepad">Notepad++</a></li>
						<li><a href="#vim">Vim</a></li>
						<li><a href="#emacs">Emacs</a></li>
					</ol>
			</ol>
	</ol>
</ul>

## Problem<a name="problem"></a>

Consider the following equations:

<img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/clearerCode/OriginalEquations.png" alt="Original Equations" width="275">

In older languages such as Fortran, C, and C++, variable names were restricted to alphnumeric characters. The above equations would have been implemented like this:

<img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/clearerCode/BoringCode.png" alt="Boring Code" width="550">

Not very easy to see what's going on, seemingly unrelated to the original equations, and painstaking to debug.

However unicode-enabled languages such as Java, Python 3, C#, or Julia enable implementations such as this:

<img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/clearerCode/PrettyCode.png" alt="Pretty Code" width="400">

This is significantly easier to read and so much closer to the original equations that even someone with no software background can easily read and debug the script.

## Solution<a name="solution"></a>
To be user-friendly and legible, two things need to happen:

### 1. Enable Unicode fonts<a name="enableFonts"></a>

If `♃ᵦ ω̃ ξ⃗ n̈₀ ∛Δ̇‴` shows up as `⍰⍰⍰⍰`, your browser does not know how to handle the necessary Unicode characters.

It's no good typing beautiful scripts if you can't read them. All interfaces through which you view and edit code must use unicode-enabled fonts.

Click here for how to change the fixed-width fonts in your browsers, shells, and text editors.

### 2. Enable auto-completions<a name="autoCompletions"></a>

To be useful, typing unicode characters must be as straightforward as tpying alphanumeric characters, otherwise no-one will bother. Auto-completion programs ensure that typing `nddot` automatically corrects to `n̈`.

Implementations vary depending on program and operating system, but I've collected a few ideas here.

That's it! By changing system fonts and using auto-completions, your scripts can be more user-friendly and efficient than ever before.

## Appendices<a name="appendices"></a>

### 1. Fixed-width font comparisons<a name="fontComparisons"></a>

### 2. Change default fixed-width fonts<a name="changeFonts"></a>

a. Browsers<a name="browsers"></a>
  i. Chrome<a name="chrome"></a>
  ii. Firefox<a name="firefox"></a>
  iii. Safari<a name="safari"></a>
b. Shell<a name="shell"></a>
  i. OSX Terminal<a name="osx"></a>
  ii. Windows Command Prompt<a name="windows"></a>
  iii. Linux shell<a name="linux"></a>

### 3. Auto-completion implementations<a name="autoCompletionImplementation"></a>

a. Operating systems<a name="os"></a>
  i. Windows (system-wide)<a name="windowsImp"></a>
  ii. OSX (system-wide)<a name="osxImp"></a>
b. Common text editors<a name="textEditors"></a>
  i. Sublime Text<a name="sublime"></a>
  ii. Notepad++<a name="notepad"></a>
  iii. Vim<a name="vim"></a>
  iv. Emacs<a name="emacs"></a>