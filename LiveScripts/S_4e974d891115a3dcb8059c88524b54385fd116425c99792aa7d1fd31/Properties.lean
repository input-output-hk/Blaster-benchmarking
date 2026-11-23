import LiveScripts.Shared
import LiveScripts.S_4e974d891115a3dcb8059c88524b54385fd116425c99792aa7d1fd31.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e974d891115a3dcb8059c88524b54385fd116425c99792aa7d1fd31.script [datum, redeemer, ctx] 10000]
