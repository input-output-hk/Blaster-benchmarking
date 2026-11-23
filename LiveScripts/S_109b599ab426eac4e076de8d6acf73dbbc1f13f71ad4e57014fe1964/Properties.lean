import LiveScripts.Shared
import LiveScripts.S_109b599ab426eac4e076de8d6acf73dbbc1f13f71ad4e57014fe1964.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_109b599ab426eac4e076de8d6acf73dbbc1f13f71ad4e57014fe1964.script [ctx] 10000]
