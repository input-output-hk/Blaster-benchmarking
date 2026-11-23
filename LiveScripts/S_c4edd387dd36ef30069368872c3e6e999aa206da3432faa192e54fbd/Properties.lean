import LiveScripts.Shared
import LiveScripts.S_c4edd387dd36ef30069368872c3e6e999aa206da3432faa192e54fbd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4edd387dd36ef30069368872c3e6e999aa206da3432faa192e54fbd.script [ctx] 10000]
