class ez5.OrcidUserPlugin extends ez5.UserPlugin
	getTabs: (tabs) ->
		tabs.push
			name: "orcid"
			text: $$("orcid.user.plugin.tab-text")
			content: =>
				form = new CUI.Form
					data: @_user.data.user
					name: "custom_data"
					fields: [
						type: CUI.Input
						name: "orcid"
						form:
							label: $$("orcid.user.plugin.form.label")
							hint: $$("orcid.user.plugin.form.hint.md")
					]

				return form.start()

		return tabs

	getInfoDivRows: (rows) ->
		orcid = @_user.data.user.custom_data.orcid
		if orcid
			rows.push
				key: $$("orcid.user.plugin.info-row")
				value: orcid
		return

	getSaveData: (saveData) ->
		saveData.user.custom_data.orcid = @_user.data.user.custom_data.orcid
		return

User.plugins.registerPlugin(ez5.OrcidUserPlugin)
