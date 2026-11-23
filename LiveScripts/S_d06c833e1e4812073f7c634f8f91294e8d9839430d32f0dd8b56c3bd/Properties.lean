import LiveScripts.Shared
import LiveScripts.S_d06c833e1e4812073f7c634f8f91294e8d9839430d32f0dd8b56c3bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d06c833e1e4812073f7c634f8f91294e8d9839430d32f0dd8b56c3bd.script [ctx] 10000]
