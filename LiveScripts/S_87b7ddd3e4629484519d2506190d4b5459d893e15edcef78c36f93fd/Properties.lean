import LiveScripts.Shared
import LiveScripts.S_87b7ddd3e4629484519d2506190d4b5459d893e15edcef78c36f93fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_87b7ddd3e4629484519d2506190d4b5459d893e15edcef78c36f93fd.script [ctx] 10000]
