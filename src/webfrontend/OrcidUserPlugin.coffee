class ez5.OrcidUserPlugin extends ez5.UserPlugin

	@URL: "https://orcid.org/"
	@REGEX_ID: /^0000-000(1-[5-9]|2-[0-9]|3-[0-4])\d{3}-\d{3}[\dX]$/

	getTabs: (tabs) ->
		tabs.push
			name: "orcid"
			text: $$("orcid.user.plugin.tab-text")
			content: =>
				outputField = new CUI.DataFieldProxy
					form:
						label: $$("orcid.user.plugin.form.url.label")
					element: =>
						orcid = @_user.data.user.custom_data.orcid
						if CUI.util.isEmpty(orcid)
							return new CUI.Label(text: $$("orcid.user.plugin.form.url.empty.md"), markdown: true)
						if not ez5.OrcidUserPlugin.REGEX_ID.test(orcid)
							return new CUI.Label(text: $$("orcid.user.plugin.form.url.not-valid.md"), markdown: true)
						return new CUI.Label(text: $$("orcid.user.plugin.form.url.link.md", url: ez5.OrcidUserPlugin.URL + orcid), markdown: true)

				form = new CUI.Form
					data: @_user.data.user
					name: "custom_data"
					fields: [
						type: CUI.Input
						name: "orcid"
						form:
							label: $$("orcid.user.plugin.form.id.label")
							hint: $$("orcid.user.plugin.form.id.hint.md")
						onDataChanged: ->
							outputField.reload()
					,
						outputField
					]

				return form.start()

		return tabs

	getSaveData: (saveData) ->
		saveData.user.custom_data.orcid = @_user.data.user.custom_data.orcid
		return

	isAllowed: ->
		return @_user.data.user.type == "easydb"

User.plugins.registerPlugin(ez5.OrcidUserPlugin)
