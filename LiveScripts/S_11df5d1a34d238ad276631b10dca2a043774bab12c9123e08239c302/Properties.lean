import LiveScripts.Shared
import LiveScripts.S_11df5d1a34d238ad276631b10dca2a043774bab12c9123e08239c302.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_11df5d1a34d238ad276631b10dca2a043774bab12c9123e08239c302.script [ctx] 10000]
