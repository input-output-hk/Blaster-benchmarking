import LiveScripts.Shared
import LiveScripts.S_adcac19704119dbab87615a235ef4e45a64bb7b79fc9fa56ad4548e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_adcac19704119dbab87615a235ef4e45a64bb7b79fc9fa56ad4548e8.script [ctx] 10000]
