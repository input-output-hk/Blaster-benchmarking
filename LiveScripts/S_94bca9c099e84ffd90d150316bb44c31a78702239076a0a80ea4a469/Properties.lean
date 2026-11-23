import LiveScripts.Shared
import LiveScripts.S_94bca9c099e84ffd90d150316bb44c31a78702239076a0a80ea4a469.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94bca9c099e84ffd90d150316bb44c31a78702239076a0a80ea4a469.script [ctx] 10000]
