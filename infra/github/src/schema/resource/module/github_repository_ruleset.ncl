let
  { SingleElementArray } = import "../../../util/contract.ncl",
in
let
  BaseSchema = {
    name | String,
    repository | String,
    enforcement
      | [| 'active, 'disabled, 'evaluate |]
      | doc "evaluate is currently only supported for owners of type organization."
      | default
      = 'active,
    bypass_actors
      | optional
      | doc "Don't use, if needed, make schema.",
    target
      | [| 'branch, 'tag, 'push |],
    rules
      | Array Dyn
      | SingleElementArray,
  },
in
{
  GithubRepositoryRulesetSchema = 
    GithubRepositoryRulesetTagSchema
    & GithubRepositoryRulesetBranchSchema
    & GithubRepositoryRulesetPushSchema,
  GithubRepositoryRulesetTagSchema =
    BaseSchema
    & {
      target
        | # tag のみ
      conditions
        | Array Dyn
        | SingleElementArray,
    },
    # GithubRepositoryRulesetBranchSchema
    # GithubRepositoryRulesetPushSchema
}
