# Emoticon plugin for Movable Type
# Author: Milad Nekofar (http://www.nekofar.com)
# Released under the Artistic License
#
# $Id$

package MT::Plugin::Emoticon;

use strict;
use MT::Plugin;

my $plugin = MT::Plugin->new({
	name => '<MT_TRANS phrase="Emoticon">',
	version => '0.1b',
	description => '<MT_TRANS phrase="Simply add emoticons in the entries and comments.">',
	author_name => '<MT_TRANS phrase="Milad Nekofar">',
	author_link => 'http://www.nekofar.com/',
#	settings => new MT::PluginSettings([
#		['emoticon_type'],
#	]),
#	config_template => 'config.tmpl',
	l10n_class => 'Emoticon::L10N',
});
MT->add_plugin($plugin);

MT->add_text_filter('emoticon' => {
    label => MT->translate('Emoticon'),
    on_format => sub { emoticon($_[0]) }   
});

sub emoticon {
	my $str = shift;
	require Text::Emoticon;
	my $emoticon_type = 'Yahoo';
  	my $emoticon = Text::Emoticon->new($emoticon_type, { strict => 1, xhtml => 0 });
	$str = $emoticon->filter($str);
#	if ($emoticon_text_filter == '__defualt__'){
#		MT::Util::html_text_transform($str);
#	}
}