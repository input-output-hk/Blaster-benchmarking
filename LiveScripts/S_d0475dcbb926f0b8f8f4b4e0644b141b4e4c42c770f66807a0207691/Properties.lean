import LiveScripts.Shared
import LiveScripts.S_d0475dcbb926f0b8f8f4b4e0644b141b4e4c42c770f66807a0207691.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0475dcbb926f0b8f8f4b4e0644b141b4e4c42c770f66807a0207691.script [ctx] 10000]
