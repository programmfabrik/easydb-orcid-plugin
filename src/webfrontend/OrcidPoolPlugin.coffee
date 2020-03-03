class ez5.OrcidPoolPlugin extends ez5.PoolPlugin
	getTabs: (tabs) ->
		tabs.push
			name: "orcid"
			text: $$("orcid.pool.plugin.tab-text")
			content: =>
				form = new CUI.Form
					data: @_pool.data.pool
					name: "custom_data"
					fields: [
						type: CUI.Input
						name: "orcid"
						form:
							label: $$("orcid.pool.plugin.form.label")
							hint: $$("orcid.pool.plugin.form.hint.md")
					]

				return form.start()

		return tabs

	getInfoDivRows: (rows) ->
		orcid = @_pool.data.pool.custom_data.orcid
		if orcid
			rows.push
				key: $$("orcid.pool.plugin.info-row")
				value: orcid
		return

	getInfoDiv: (nodes) ->
		return

	getSaveData: (saveData) ->
		saveData.pool.custom_data.orcid = @_pool.data.pool.custom_data.orcid
		return

Pool.plugins.registerPlugin(ez5.OrcidPoolPlugin)
