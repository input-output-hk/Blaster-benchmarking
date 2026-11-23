import LiveScripts.Shared
import LiveScripts.S_4844c0aaa7be604f80ad99a04aa46e05aca47e1b52eab9bfe8219a5d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4844c0aaa7be604f80ad99a04aa46e05aca47e1b52eab9bfe8219a5d.script [ctx] 10000]
