module.exports = {
	config: {
		fontSize: 12,
		padding: '5px 5px',
		shell: 'zsh',
		shellArgs: ['--login'],
		copyOnSelect: true,
		tabIcons: {processNameRegex: /: (.*?)$/},
	},
	plugins: [
		'hyper-snazzy',
		'hyper-tab-icons-plus',
	],
};
